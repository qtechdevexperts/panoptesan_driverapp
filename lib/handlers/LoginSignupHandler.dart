import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:panoptesan_alpha/helpers/api-constants.dart';
import 'package:http/http.dart' as http;
import 'package:panoptesan_alpha/helpers/localstorage.dart';
import 'package:panoptesan_alpha/models/user-model.dart';

import '../firebase_options.dart';

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

  forgotpassword(String email) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse(ApiConstants.baseUrl + '/forget-password'));
    request.body = json.encode({"email": email});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      throw (response.reasonPhrase.toString());
    }
  }

  verifypincode(String email, String pincode) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse(ApiConstants.baseUrl + '/verify-otp'));
    request.body = json.encode({"email": email, "otp": pincode});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(await response.stream.bytesToString());

      throw (response.reasonPhrase.toString());
    }
  }

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
      try {
        await settoken();
      } catch (e) {
        print(e);
      }
      LocalStorage.saveUser(user);
    } else if (response.statusCode == 401) {
      throw (json['message']);
    } else if (response.statusCode == 404) {
      throw ("Email or Password is incorrect");
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

    var url = ApiConstants.baseUrl + ApiConstants.registerEndpoint;

    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var token = json['data']['token'];
      var user = UserModel.fromJson(json['data']['user']);
      await LocalStorage.prefs?.setString('token', token);
      try {
        await settoken();
      } catch (e) {
        print(e);
      }
    } else if (response.statusCode == 401) {
      throw (json['message']);
    } else if (response.statusCode == 500) {
      throw (json['message']);
    } else {
      throw (json);
    }
  }

  Future cleartoken() async {
    String? fcmToken = "";

    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    var token = await LocalStorage.prefs?.getString("token");

    String id = "";
    String device_type = "";

    try {
      if (Platform.isAndroid) {
        id = deviceInfo.data["id"];
        device_type = "Android";
      }
      if (Platform.isIOS) {
        id = deviceInfo.data["identifierForVendor"];
        device_type = "IOS";
      }
    } catch (e) {
      print(e);
    }

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request =
          http.Request('POST', Uri.parse(ApiConstants.baseUrl + '/token'));
      request.body = json.encode(
          {"token": fcmToken, "device_id": id, "device_type": device_type});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        throw (response.reasonPhrase.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  Future settoken() async {
    String? fcmToken = "";

    try {
      fcmToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      print(e);
    }

    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    var token = await LocalStorage.prefs?.getString("token");

    String id = "";
    String device_type = "";

    try {
      if (Platform.isAndroid) {
        id = deviceInfo.data["id"];
        device_type = "Android";
      }
      if (Platform.isIOS) {
        id = deviceInfo.data["identifierForVendor"];
        device_type = "IOS";
      }
    } catch (e) {
      print(e);
    }

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request =
          http.Request('POST', Uri.parse(ApiConstants.baseUrl + '/token'));
      request.body = json.encode(
          {"token": fcmToken, "device_id": id, "device_type": device_type});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        throw (response.reasonPhrase.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  sendsos(String? lat, String? lng, String? address) async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('POST', Uri.parse(ApiConstants.baseUrl + '/alert'));
    request.body = json.encode({"lat": lat, "long": lng, "address": address});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      throw (response.reasonPhrase.toString());
    }
  }

  setpassword(String email, String password, String otp) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse(ApiConstants.baseUrl + '/set-password'));
    request.body =
        json.encode({"email": email, "password": password, "otp": otp});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      throw (response.reasonPhrase.toString());
    }
  }

  Future<UserModel?> handleFacebookLogin() async {
    // Log in with Facebook and request the required permissions (default is email)
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token

    // Check if the login was successful
    if (result.status == LoginStatus.success) {
      // Get the access token

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential
      var user = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      final accessToken = result.accessToken!.token;

      var idtoken = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(ApiConstants.baseUrl + '/facebook/login'));
      request.body = json.encode({"token": idtoken});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var jsn = jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        var token = jsn['data']['token'];
        var user = UserModel.fromJson(jsn['data']['user']);

        await LocalStorage.prefs?.setString('token', token);
        try {
          await settoken();
        } catch (e) {
          print(e);
        }
        LocalStorage.saveUser(user);

        return user;
      } else {
        throw (json);
      }
    } else {
      await FacebookAuth.instance.logOut();
      throw ('Facebook login failed: ${result.status}');
    }
  }

  Future<UserModel?> loginWithGoogle() async {
    GoogleSignIn _googleSignIn;
    if (Platform.isIOS) {
      _googleSignIn = GoogleSignIn(
          scopes: ['email'],
          clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);
    } else {
      _googleSignIn = GoogleSignIn(
          scopes: ['email'],
          clientId: DefaultFirebaseOptions.currentPlatform.androidClientId);
    }

    final GoogleSignInAccount? googleUser;
    try {
      googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled the login
        return null;
      }
    } catch (e) {
      throw (e);
    }

    // If you need an access token, you can obtain it like this:
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final accessToken = googleAuth.accessToken;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var user = await FirebaseAuth.instance.signInWithCredential(credential);

    var idtoken = await FirebaseAuth.instance.currentUser?.getIdToken();

    var cred = user.credential!.accessToken;

    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse(ApiConstants.baseUrl + '/google/login'));
    request.body = json.encode({"token": idtoken});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var jsn = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      var token = jsn['data']['token'];
      var user = UserModel.fromJson(jsn['data']['user']);
      await LocalStorage.prefs?.setString('token', token);
      try {
        await settoken();
      } catch (e) {
        print(e);
      }
      LocalStorage.saveUser(user);

      return user;
    } else {
      throw (json);
    }
  }
}
