import 'package:panoptesan_alpha/models/user.dart';

class ApiResponse<T> {
  bool? status;
  int? code;
  String? message;
  T? data;

  ApiResponse({this.status, this.code, this.message, this.data});

  ApiResponse.fromJson(Map json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];

    if (T is User) {
      data = json['data'] != null ? User.fromJson(json['data']) as T : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;

    if (this.data != null && this.data is User) {
      data['data'] = (this.data! as User).toJson();
    }

    return data;
  }
}
