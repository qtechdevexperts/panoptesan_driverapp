import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:panoptesan_alpha/helper/localstorage.dart';
import 'package:panoptesan_alpha/models/user-model.dart';
import 'package:panoptesan_alpha/service/api-service.dart';
import 'package:panoptesan_alpha/helper/api-constants.dart';
import 'package:panoptesan_alpha/models/api-response.dart';
import 'package:panoptesan_alpha/models/auth-response.dart';
import 'package:panoptesan_alpha/models/user.dart';
import 'package:http/http.dart' as http;

class LoginSignupHandler {
  // static Future<void> login(String email, String password, Function successCallback) async {
  //     var body = new Map<String, String>();
  //     body["email"] = email;
  //     body["password"] = password;

  //     var apiResponseMap = await ApiService.postRequest(ApiConstants.loginEndpoint, body, new Map<String, String>());

  //     print(apiResponseMap);

  //     var apiResponse = ApiResponse<Auth>.fromJson(apiResponseMap);

  //     print(apiResponse);

  //     if (apiResponse != null && apiResponse.status == true) {
  //         //Save token here
  //         successCallback();
  //     } else {
  //         //Show error
  //     }
  // }

  Future<void> login(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({"email": email, "password": password});

    final timeout = Duration(seconds: 10);
    var url = ApiConstants.baseUrl + ApiConstants.loginEndpoint;
    final response = await http
        .post(Uri.parse(url), headers: headers, body: body)
        .timeout(timeout);

    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var token = json['data']['token'];
      var user = UserModel.fromJson(json['data']['user']);
      await LocalStorage.prefs?.setString('token', token);

      LocalStorage.saveUser(user);
    } else if (response.statusCode == 401) {
      throw (json['message']);
    } else {
      throw (json);
    }
  }

  Future<void> signup(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({
      "email": email,
      "password": password,
      "city_id": 1,
      "is_active": true
    });

    final timeout = Duration(seconds: 10);
    var url = ApiConstants.baseUrl + ApiConstants.registerEndpoint;

    final response = await http
        .post(Uri.parse(url), headers: headers, body: body)
        .timeout(timeout);

    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var token = json['data']['token'];
      var user = UserModel.fromJson(json['data']['user']);
      await LocalStorage.prefs?.setString('token', token);
    } else if (response.statusCode == 401) {
      throw (json['message']);
    } else {
      throw (json);
    }
  }

  static Future<void> register(String name, String email, String password,
      String repeatPassword, Function successCallback) async {
    if (password != repeatPassword) {
      return;
    }

    var body = new Map<String, String>();
    body["email"] = email;
    body["password"] = password;
    body["city_id"] = "1";
    body["is_active"] = "true";

    var apiResponseMap = await ApiService.postRequest(
        ApiConstants.registerEndpoint, body, new Map<String, String>());

    print(apiResponseMap);

    var apiResponse = ApiResponse<Auth>.fromJson(apiResponseMap);

    print(apiResponse);

    if (apiResponse != null && apiResponse.status == true) {
      //Save token here
      successCallback();
    } else {
      //Show error
    }
  }

  Future settoken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    var token = await LocalStorage.prefs?.getString("token");

    String id = deviceInfo.data["id"];

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('POST',
        Uri.parse('http://panoptesan.thesuitchstaging.com:4000/user/token'));
    request.body = json.encode({"token": fcmToken, "device_id": id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  sendsos(String? lat, String? lng, String? address) async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('POST',
        Uri.parse('http://panoptesan.thesuitchstaging.com:4000/user/alert'));
    request.body = json.encode({"lat": lat, "long": lng, "address": address});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
