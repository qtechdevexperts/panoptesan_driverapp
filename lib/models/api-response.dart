import 'package:panoptesan_alpha/helper/activator.dart';

class ApiResponse<T> {
    bool? status;
    int? code;
    String? message;
    T? data;

    ApiResponse({this.status, this.code, this.message, this.data});

    ApiResponse.fromJson(Map<String, dynamic> json) {
        status = json['status'];
        code = json['code'];
        message = json['message'];
        data = json['data'] != null ? Activator.createInstance(T).fromJson(json['data']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;
        data['code'] = this.code;
        data['message'] = this.message;
        
        if (this.data != null) {
            data['data'] = this.data!.toJson();
        }
        
        return data;
    }
}