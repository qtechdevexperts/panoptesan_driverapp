import 'dart:convert';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:http/http.dart' as http;
import 'package:panoptesan_alpha/helper/localstorage.dart';
import 'package:panoptesan_alpha/helper/snackbar.dart';

import '../helper/api-constants.dart';
import '../models/profile-model.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  TextEditingController name = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController address = new TextEditingController();
  Profile? profile;
  Future<Profile> getprofile() async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.Request('GET', Uri.parse(ApiConstants.baseUrl + '/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var jsonData = jsonDecode(result);

      return Profile.fromJson(jsonData["data"]["profile"]);
    } else {
      print(response.reasonPhrase);
      throw ("Error");
    }
  }

  callgetprofile(context, callback) async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Please Wait....."), title: const Text("Loading"));
    progressDialog.show();
    try {
      this.profile = await getprofile();
      this.desc.text = profile?.description ?? "";
      this.name.text = profile?.name ?? "";
      this.gender.text = profile?.address ?? "";

      progressDialog.dismiss();
      update();
      callback();
    } catch (e) {
      progressDialog.dismiss();
      SnackbarWidget().showsnackbar(e.toString(), context);
    }
  }

  Future<void> UpdateProfile(String name, String gender, String dob,
      String description, String address) async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'PATCH', Uri.parse(ApiConstants.baseUrl + '/profile/update'));
    request.body = json.encode({
      "name": "$name",
      "gender": "$gender",
      "dob": "$dob",
      "description": "$description",
      "vehicle_name": "",
      "vehicle_model": "",
      "vehicle_make": "",
      "driving_habit": "",
      "medical_condition": "",
      "medical_notes": "",
      "medications": "",
      "allergies": "",
      "organ_donor": "",
      "weight": "",
      "height": "",
      "address": "$address",
      "relationship": "BRT",
      "number": ""
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw ("Error");
    }
  }
}
