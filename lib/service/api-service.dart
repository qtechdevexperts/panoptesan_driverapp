import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:panoptesan_alpha/helper/api-constants.dart';
import 'package:panoptesan_alpha/models/api-response.dart';
import 'package:panoptesan_alpha/models/auth-response.dart';
import 'package:panoptesan_alpha/models/user.dart';

class ApiService {

    ApiResponse();

    static Future<T?> _makeRequest<T>(RestMethod requestMethod, String endPoint, Map<dynamic, dynamic> body, Map<dynamic, dynamic> headers) async {
        try {
            if (headers == null) {
                headers = new Map();
            }

            headers["Content-Type"] = "application/json; charset=UTF-8";

            var url = ApiConstants.baseUrl + endPoint;
            var response = null;

            if (requestMethod == RestMethod.POST) {
                response = await http.post(
                    Uri.parse(url),
                    headers: headers,
                    body: jsonEncode(body),
                );
            } else if (requestMethod == RestMethod.GET) {

                if (body != null) {
                    url += "?";

                    for (var key in body.keys) {
                        url += (key + "=" + (body[key] ?? "") + "&");
                    }

                    url = url.substring(0, url.length - 1);
                }

                response = await http.get(
                    Uri.parse(url),
                    headers: headers
                );
            }

            return T.fromJson(jsonDecode(response.body));
        } catch (e) {
            log(e.toString());
        }
    }

    static Future<T?> postRequest<T>(String endPoint, Map<dynamic, dynamic> body, [Map<dynamic, dynamic> headers]) async {
        return await _makeRequest<T>(RestMethod.POST, endPoint, body, headers);
    }

    static Future<T?> getRequest<T>(String endPoint, Map<dynamic, dynamic> body, [Map<dynamic, dynamic> headers]) async {
        return await _makeRequest<T>(RestMethod.GET, endPoint, body, headers);
    }

    
}

enum RestMethod {
    POST,
    GET,
    PUT,
    DELETE,
    PATCH
}