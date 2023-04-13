import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CameraGetController extends GetxController {
  var postType = 1;

  void changePost(value) {
    postType = value;
    update();
  }
}
