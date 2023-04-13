import 'package:panoptesan_alpha/service/api-service.dart';
import 'package:panoptesan_alpha/helper/api-constants.dart';
import 'package:panoptesan_alpha/models/api-response.dart';
import 'package:panoptesan_alpha/models/user.dart';

class LoginSignupHandler {
    static Future<void> login(String email, String password, Function() callback) async {
        var body = new Map();
        body["email"] = email;
        body["password"] = password;
        
        var apiResponse = await ApiService.postRequest<ApiResponse<User>>(ApiConstants.loginEndpoint, body);
        if (apiResponse != null && apiResponse.status == true) {
            //Save token here
            callback();
        } else {
            //Show error
        }
    }
}