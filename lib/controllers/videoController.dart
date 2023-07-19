import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

import '../helpers/api-constants.dart';
import '../helpers/localstorage.dart';
import '../models/videomodel.dart';

class VideoController extends GetxController {
  List<VideoModel>? videos = [];

  //List<VideoModel> archives = [];

  File? file;

  String url = "";
  bool videoscreenloading = false;
  @override
  void onInit() {
    // TODO: implement onInit

    setvideo();
  
    super.onInit();
  }

  setvideo() async {
    videoscreenloading = true;
    update();
    try {
      videos = await getvideofromAPI();
      videoscreenloading = false;
      update();
    } catch (e) {
      videoscreenloading = false;
      update();
    }
  }

  var sliderValue = 0.0;
  var position = Duration.zero;

 

  uploadvideo(File file) async {
    var token = LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.baseUrl + '/video/upload?type=VIDEO'));
    request.files.add(await http.MultipartFile.fromPath('video', file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      var result = await response.stream.bytesToString();

      print(result);
      print(response.reasonPhrase.toString());
      throw (result);
    }
  }

  uploadvideocrash(File file) async {
    var token = LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = ApiConstants.baseUrl + '/video/upload?type=VIDEO&file=CRASH';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('video', file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      var result = await response.stream.bytesToString();

      print(result);
      print(response.reasonPhrase.toString());
      throw (result);
    }
  }

  Future<List<VideoModel>?> getvideofromAPI() async {
    var token = LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('GET', Uri.parse(ApiConstants.baseUrl + '/videos'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      Map<String, dynamic> jsonData = jsonDecode(result);
      List<dynamic> data = jsonData['data'] ?? [];

      List<VideoModel> videos =
          data.map((videoJson) => VideoModel.fromJson(videoJson)).toList();

      return videos;
    } else {
      throw(response.reasonPhrase.toString());
    }
  }



  late VideoPlayerController controller;
  getVideo(String url) {
    this.url = url;
    controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        update();
      });
  }

  updateValue(dynamic value) {
    //controller!.value.position.inMilliseconds.t
    update();
  }

  Future<void> updateSeeker() async {
    final newPosition = controller.value.position;
    position = newPosition;
  }

  editvideo(String videoid, String filepath) async {
    var token = LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = ApiConstants.baseUrl + '/video/$videoid' + "?type=VIDEO";
    var request = http.MultipartRequest('PUT', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('video', filepath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      await setvideo();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  deletevideo(String videoid) async {
    var token = LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'DELETE', Uri.parse(ApiConstants.baseUrl + '/video/$videoid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    await  setvideo();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  getvideowithfilter(String startdate, String endDate) async {
    videoscreenloading = true;
    try {
      var token = LocalStorage.prefs?.getString("token");
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET',
          Uri.parse(ApiConstants.baseUrl +
              '/videos?startdate=$startdate&enddate=$endDate'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
  var result = await response.stream.bytesToString();
      if (response.statusCode == 200) {

        Map<String, dynamic> jsonData = jsonDecode(result);
        List<dynamic> data = jsonData['data'] ?? [];

        List<VideoModel> videos =
            data.map((videoJson) => VideoModel.fromJson(videoJson)).toList();

        this.videos = videos;

        this.videoscreenloading = false;
        update();
      } else {
        throw(result);
      }
    } catch (e) {
      this.videoscreenloading = false;
      update();
    }
  }
}
