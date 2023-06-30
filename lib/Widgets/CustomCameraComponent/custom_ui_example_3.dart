import 'dart:io';


import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:panoptesan_alpha/widgets/CustomCameraComponent/panicbutton.dart';
import 'package:panoptesan_alpha/widgets/CustomCameraComponent/savefile.dart';

import 'bottomaction.dart';
import 'cameracomponent.dart';

import 'counter.dart';
import 'file_utils.dart';

class CustomUiExample3 extends StatelessWidget {
  const CustomUiExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.custom(
        builder: (cameraState, previewSize, previewRect) {
         

          return CameraComponent(
            state: cameraState,
            bottomActions: CameraBottomActions(     state: cameraState,
          left: PanicButton(state: cameraState),
        //  right:CounterDuration(state: cameraState),
          //  middleContent: Container(),
            onMediaTap: (v) {},
            //topActions: Container(),
           ) );
        },
        saveConfig: SaveConfig.video(
          pathBuilder: (sensors) async {
            // Return a valid file path (must be a mp4 file)

            print("path");

            var pp = await path();

            var p = SingleCaptureRequest(pp, sensors.first);

            Savefile.file = new File(p.file!.path);

            print(Savefile.file!.path);
            return p;
          },
        ),
      ),
    );
  }
}

class TakePhotoUI extends StatelessWidget {
  final PhotoCameraState state;

  const TakePhotoUI(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RecordVideoUI extends StatelessWidget {
  final CameraState state;
  final bool recording;

  const RecordVideoUI(this.state, {super.key, required this.recording});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Row(
            children: [
              AwesomeCaptureButton(state: state),
              const Spacer(),
              //   AwesomeCaptureButton(state: state),
              // StreamBuilder(
              //   stream: state.captureState$,
              //   builder: (_, snapshot) {
              //     return SizedBox(
              //       width: 100,
              //       height: 100,
              //       child: CustomMediaPreview(
              //         mediaCapture: snapshot.data,
              //         onMediaTap: (mediaCapture) {

              //           OpenFile.open(
              //             mediaCapture.captureRequest
              //                 .when(single: (single) => single.file?.path),
              //           );
              //         },
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
