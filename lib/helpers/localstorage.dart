import 'package:panoptesan_alpha/models/user-model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorage {
  static SharedPreferences? prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();

    await LocalStorage.getUserData();
  }

  static UserModel? userModel;

  static Future saveUser(UserModel userModel) async {
    Map<String, dynamic> userJson = userModel.toJson();

    String nameString = jsonEncode(userJson);

    await prefs!.setString('user', nameString);
  }

  static getUserData() {
    try {
      userModel = UserModel.fromJson(jsonDecode(prefs!.getString('user')!));
    } catch (e) {}
  }
}
