import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? controller;

  var position = Duration.zero;

  getVideo() async {
    controller = await VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', videoPlayerOptions: VideoPlayerOptions());
    controller?.initialize().then((val) {
      val;
      controller?.setLooping(true);
      controller?.addListener(() {
        controller = controller;
        update();
      });
      update();
    });
  }

  updateValue(dynamic value) {
    //controller!.value.position.inMilliseconds.t
    update();
  }

  Future<void> updateSeeker() async {
    final newPosition = await controller!.value.position;
    position = newPosition;
  }
}
