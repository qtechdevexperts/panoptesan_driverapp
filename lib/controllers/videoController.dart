import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

import '../helpers/api-constants.dart';
import '../helpers/localstorage.dart';
import '../models/videomodel.dart';

class VideoController extends GetxController {
  List<VideoModel>? videos = [];
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
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

  // uploadvideo(File file) async {
  //   var token = LocalStorage.prefs?.getString("token");
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };

  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse(ApiConstants.baseUrl + '/video/upload?type=VIDEO'));
  //   request.files.add(await http.MultipartFile.fromPath('video', file.path));
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     var result = await response.stream.bytesToString();

  //     print(result);
  //     print(response.reasonPhrase.toString());
  //     throw (result);
  //   }
  // }
  Future<File> renameFileAsync(File oldFile, String newFileName) async {
    if (oldFile.existsSync()) {
      // Get the parent directory of the old file
      String directory = oldFile.parent.path;

      // Create the new file path with the new file name
      String newFilePath = '$directory/$newFileName';

      // Rename the file asynchronously
      await oldFile.rename(newFilePath);

      // Create a new File object for the renamed file
      File renamedFile = File(newFilePath);

      return renamedFile;
    } else {
      throw FileSystemException('File not found.');
    }
  }

  uploadvideo(File file) async {
    var token = LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var result = await VideoCompress.compressVideo(
      file.path,

      quality: VideoQuality.MediumQuality,
      deleteOrigin: false, // It's false by default
    );

    //var fyle = await renameFileAsync(result!.file!,file.path.split('/').last);

    var data = dio.FormData.fromMap({
      'video': await dio.MultipartFile.fromFile(result!.path!,
          filename: "pp.mp4")
    });

    var dio1 = dio.Dio();
    var response = await dio1.request(
      ApiConstants.baseUrl + '/video/upload?type=VIDEO',
      options: dio.Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
  uploadvideocrash(File file) async {
    var token = LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var result = await VideoCompress.compressVideo(
      file.path,

      quality: VideoQuality.MediumQuality,
      deleteOrigin: false, // It's false by default
    );

    //var fyle = await renameFileAsync(result!.file!,file.path.split('/').last);

    var data = dio.FormData.fromMap({
      'video': await dio.MultipartFile.fromFile(result!.path!,
          filename: "ppcrash.mp4")
    });

    var dio1 = dio.Dio();
    var response = await dio1.request(
      ApiConstants.baseUrl +'/video/upload?type=VIDEO&file=CRASH',
      options: dio.Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }



  // uploadvideocrash(File file) async {
  //   var token = LocalStorage.prefs?.getString("token");
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };

  //   var url = ApiConstants.baseUrl + '/video/upload?type=VIDEO&file=CRASH';
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.files.add(await http.MultipartFile.fromPath('video', file.path));
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     var result = await response.stream.bytesToString();

  //     print(result);
  //     print(response.reasonPhrase.toString());
  //     throw (result);
  //   }
  // }

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
      throw (response.reasonPhrase.toString());
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

    var result = await VideoCompress.compressVideo(
      filepath,

      quality: VideoQuality.MediumQuality,
      deleteOrigin: false, // It's false by default
    );

    //var fyle = await renameFileAsync(result!.file!,file.path.split('/').last);

    var data = dio.FormData.fromMap({
      'video': await dio.MultipartFile.fromFile(result!.path!,
          filename: "ppcrash.mp4")
    });

    var dio1 = dio.Dio();
    var response = await dio1.request(
      ApiConstants.baseUrl +'/video/$videoid' + "?type=VIDEO",
      options: dio.Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
       print(response.data);
      await setvideo();
    } else {
     throw Exception(response.data);
    }
  }
  // editvideo(String videoid, String filepath) async {
  //   var token = LocalStorage.prefs?.getString("token");
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };

  //   var url = ApiConstants.baseUrl + '/video/$videoid' + "?type=VIDEO";
  //   var request = http.MultipartRequest('PUT', Uri.parse(url));
  //   request.files.add(await http.MultipartFile.fromPath('video', filepath));
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //     await setvideo();
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
// Future<void> editVideo(String videoId, String filePath) async {
//  var dio1 = dio.Dio();
//   var token = await SharedPreferences.getInstance().then((prefs) => prefs.getString("token"));
//   var headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer $token',
//   };

//   var url = ApiConstants.baseUrl + '/video/$videoId' + "?type=VIDEO";

//   FormData formData = dio.FormData.fromMap({
//     'video': await MultipartFile.fromFile(filePath, filename: 'video'),
//   });

//   try {
//     Response response = await dio.put(
//       url,
//       data: formData,
//       options: Options(headers: headers),
//     );

//     if (response.statusCode == 200) {
//       print(response.data);
//       await setVideo();
//     } else {
//       throw Exception(response.statusMessage);
//     }
//   } catch (e) {
//     print("Error: $e");
//     throw e;
//   }
// }
  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled the login
        return;
      }

      // If you need an access token, you can obtain it like this:
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print("accessToken Token: " + googleAuth.accessToken.toString());
      print("idToken Token:" + googleAuth.idToken.toString());

      // Now you can use the access token to perform requests to your backend or other services.
      // You can pass the access token to your server using the method described in the previous answer.

      // If you want to sign out the user later, you can use:
      // await _googleSignIn.signOut();
    } catch (error) {
      print("An error occurred: $error");
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
      await setvideo();
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
        throw (result);
      }
    } catch (e) {
      this.videoscreenloading = false;
      update();
    }
  }
}
