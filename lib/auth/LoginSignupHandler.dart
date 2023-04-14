import 'package:panoptesan_alpha/service/api-service.dart';
import 'package:panoptesan_alpha/helper/api-constants.dart';
import 'package:panoptesan_alpha/models/api-response.dart';
import 'package:panoptesan_alpha/models/auth-response.dart';
import 'package:panoptesan_alpha/models/user.dart';

class LoginSignupHandler {
    static Future<void> login(String email, String password, Function successCallback) async {
        var body = new Map<String, String>();
        body["email"] = email;
        body["password"] = password;
        
        var apiResponseMap = await ApiService.postRequest(ApiConstants.loginEndpoint, body, new Map<String, String>());

        print(apiResponseMap);

        var apiResponse = ApiResponse<Auth>.fromJson(apiResponseMap);

        print(apiResponse);

        if (apiResponse != null && apiResponse.status == true) {
            //Save token here
            successCallback();
        } else {
            //Show error
        }
    }
}