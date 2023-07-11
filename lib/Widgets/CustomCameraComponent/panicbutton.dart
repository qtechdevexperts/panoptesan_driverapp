import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:panoptesan_alpha/widgets/CustomCameraComponent/savefile.dart';

class PanicButton extends StatefulWidget {
  final CameraState state;

  PanicButton({required this.state});

  @override
  State<PanicButton> createState() => _PanicButtonState();
}

class _PanicButtonState extends State<PanicButton> {
  get onTap => () {
        widget.state.when(
          // onPhotoMode: (photoState) => photoState.takePhoto(),
          //onVideoMode: (videoState) => videoState.startRecording(),
          onVideoRecordingMode: (videoState) => videoState.stopRecording(),
        );
      };
  @override
  Widget build(BuildContext context) {
    return widget.state is VideoRecordingCameraState
        ? GestureDetector(
            onTap: () {
              widget.state.when(onVideoRecordingMode: (videoState) async {
                await videoState.stopRecording();

                Savefile.spnaic = true;
                Savefile.crash = true;
                Get.back();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/Group 780.svg'),
                ),
                height: 70.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffF1F2F6)),
              ),
            ),
          )
        : Container();
  }
}
