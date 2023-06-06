import 'dart:convert';
import 'dart:io';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:http/http.dart' as http;
import 'package:panoptesan_alpha/helpers/api-constants.dart';
import 'package:panoptesan_alpha/helpers/localstorage.dart';

import '../helpers/snackbar.dart';
import '../models/profile-model.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  File? file;
  TextEditingController name = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController month = new TextEditingController();
  TextEditingController day = new TextEditingController();
  TextEditingController year = new TextEditingController();
  TextEditingController carmake = new TextEditingController();
  TextEditingController carname = new TextEditingController();
  TextEditingController model = new TextEditingController();
  TextEditingController drivinghabit = new TextEditingController();
  TextEditingController medicalconditions = new TextEditingController();
  TextEditingController medicalnotes = new TextEditingController();
  TextEditingController allergies = new TextEditingController();
  TextEditingController medications = new TextEditingController();
  TextEditingController organdonor = new TextEditingController();
  TextEditingController weight = new TextEditingController();
  TextEditingController height = new TextEditingController();
  TextEditingController emergencyname = new TextEditingController();
  TextEditingController emergencyrelationship = new TextEditingController();
  TextEditingController emergencycontactnumber = new TextEditingController();

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

      var output = Profile.fromJson(jsonData["data"]);

      return output;
    } else {
      print(response.reasonPhrase);
      throw ("Error");
    }
  }

  setprofile() async {
    try {
      this.profile = await getprofile();
      this.desc.text = profile?.userDetail?.description ?? "";
      this.name.text = profile?.userDetail?.name ?? "";
      this.address.text = profile?.userDetail?.address ?? "";
      this.gender.text = profile?.userDetail?.gender ?? "";
      var list = profile?.userDetail?.dob?.split("-");
      this.carname.text = profile?.userDetail?.vehicleName ?? "";
      this.model.text = profile?.userDetail?.vehicleModel ?? "";
      try {
        this.month.text = list![0].toString();
        this.day.text = list[1].toString();
        this.year.text = list[2].toString();
      } catch (e) {}

      update();
    } catch (e) {
      print(e);
    }
  }

  callgetprofile(context, callback) async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Please Wait....."), title: const Text("Loading"));
    progressDialog.show();
    try {
      this.profile = await getprofile();
      this.desc.text = profile?.userDetail?.description ?? "";
      this.name.text = profile?.userDetail?.name ?? "";
      this.address.text = profile?.userDetail?.address ?? "";
      this.gender.text = profile?.userDetail?.gender ?? "";
      this.carname.text = profile?.userDetail?.vehicleName ?? "";
      this.model.text = profile?.userDetail?.vehicleModel ?? "";
      var list = profile?.userDetail?.dob?.split("-");

      try {
        this.month.text = list![0].toString();
        this.day.text = list[1].toString();
        this.year.text = list[2].toString();
      } catch (e) {}

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
      "vehicle_name": this.carname.text,
      "vehicle_model": this.model.text,
      "vehicle_make": this.carmake.text,
      "driving_habit": this.drivinghabit.text,
      "medical_condition": this.medicalconditions.text,
      "medical_notes": this.medicalnotes.text,
      "medications": this.medications.text,
      "allergies": this.allergies.text,
      "organ_donor": this.organdonor.text,
      "weight": this.weight.text,
      "height": this.height.text,
      "address": "$address",
      "relationship": this.emergencyrelationship.text,
      "number": this.emergencycontactnumber.text
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

  setimage(File? file) async {
    var token = await LocalStorage.prefs?.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://panoptesan.thesuitchstaging.com:4000/user/upload?type=PROFILE'));
    request.files.add(await http.MultipartFile.fromPath('photo', file!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
