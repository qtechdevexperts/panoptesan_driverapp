import 'package:panoptesan_alpha/models/user.dart';

class Auth {
  User? user;
  String? token;

  Auth({this.user, this.token});

  Auth.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;

    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }

    return data;
  }
}
