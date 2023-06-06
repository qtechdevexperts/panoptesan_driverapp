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

  @override
  void onInit() {
    // TODO: implement onInit

    setvideo();
    super.onInit();
  }

  setvideo() async {
    videos = await getvideofromAPI();

    update();
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
      print(response.reasonPhrase);
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
      List<dynamic> data = jsonData['data'];

      List<VideoModel> videos =
          data.map((videoJson) => VideoModel.fromJson(videoJson)).toList();

      return videos;
    } else {
      print(response.reasonPhrase);
    }
  }

  late VideoPlayerController controller;
  getVideo(String url) {
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
}