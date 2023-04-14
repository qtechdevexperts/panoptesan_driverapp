import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:panoptesan_alpha/helper/api-constants.dart';
import 'package:panoptesan_alpha/models/api-response.dart';
import 'package:panoptesan_alpha/models/auth-response.dart';
import 'package:panoptesan_alpha/models/user.dart';

class ApiService {

    ApiService();

    static Future<Map> _makeRequest(RestMethod requestMethod, String endPoint, Map<String, String> body, Map<String, String> headers) async {
        try {
            if (headers == null) {
                headers = new Map();
            }

            headers["Content-Type"] = "application/json; charset=UTF-8";

            var url = ApiConstants.baseUrl + endPoint;

            print(url);
            print(requestMethod);
            print(body);
            print(jsonEncode(body));

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

            print(jsonDecode(response.body));

            return jsonDecode(response.body);
        } catch (e) {
            print(e.toString());
        }

        return new Map<String, dynamic>();
    }

    static Future<Map> postRequest(String endPoint, Map<String, String> body, Map<String, String> headers) async {
        return await _makeRequest(RestMethod.POST, endPoint, body, headers);
    }

    static Future<Map> getRequest(String endPoint, Map<String, String> body, Map<String, String> headers) async {
        return await _makeRequest(RestMethod.GET, endPoint, body, headers);
    }

    
}

enum RestMethod {
    POST,
    GET,
    PUT,
    DELETE,
    PATCH
}