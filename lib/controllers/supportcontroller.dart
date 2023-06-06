import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../helpers/api-constants.dart';
import '../helpers/localstorage.dart';

class SupportController extends GetxController {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController message = new TextEditingController();

  sendsupport() async {
    var token = LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('POST', Uri.parse(ApiConstants.baseUrl + '/support'));
    request.body = json.encode({
      "email": email.text,
      "name": name.text,
      "message": message.text,
      "number": phonenumber.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      email.clear();
      name.clear();
      phonenumber.clear();
      message.clear();
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
