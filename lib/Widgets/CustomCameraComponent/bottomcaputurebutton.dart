// ignore_for_file: library_private_types_in_public_api

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/src/orchestrator/analysis/analysis_controller.dart';
import 'package:camerawesome/src/orchestrator/states/camera_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:panoptesan_alpha/widgets/CustomCameraComponent/counter.dart';
import 'package:panoptesan_alpha/widgets/CustomCameraComponent/savefile.dart';

class BottomCapture extends StatefulWidget {
  final CameraState state;

  const BottomCapture({
    super.key,
    required this.state,
  });

  @override
  State<BottomCapture> createState() => _BottomCaptureState();
}

class _BottomCaptureState extends State<BottomCapture>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double _scale;
  final Duration _duration = const Duration(milliseconds: 100);

  TimerModel timerModel = TimerModel();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    timerModel.stopTimer();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is AnalysisController) {
      return Container();
    }
    _scale = 1 - _animationController.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Column(
        children: [
          widget.state is VideoRecordingCameraState
              ? ValueListenableBuilder<int>(
                  valueListenable: timerModel.timeElapsed,
                  builder: (context, value, child) {
                    final minutes = (value ~/ 60).toString().padLeft(2, '0');
                    final seconds = (value % 60).toString().padLeft(2, '0');
                    return Text(
                      '$minutes:$seconds',
                      style: TextStyle(color: Colors.white),
                    );
                  },
                )
              : Text("", style: TextStyle(color: Colors.white)),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            key: const ValueKey('cameraButton'),
            height: 80,
            width: 80,
            child: Transform.scale(
              scale: _scale,
              child: CustomPaint(
                painter: widget.state.when(
                  onPhotoMode: (_) => CameraButtonPainter(),
                  onPreparingCamera: (_) => CameraButtonPainter(),
                  onVideoMode: (_) => VideoButtonPainter(),
                  onVideoRecordingMode: (_) =>
                      VideoButtonPainter(isRecording: true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTapDown(TapDownDetails details) {
    HapticFeedback.selectionClick();
    _animationController.forward();
  }

  _onTapUp(TapUpDetails details) {
    Future.delayed(_duration, () {
      _animationController.reverse();
    });

    onTap.call();
  }

  _onTapCancel() {
    _animationController.reverse();
  }

  get onTap => () {
        widget.state.when(
          onPhotoMode: (photoState) => photoState.takePhoto(),
          onVideoMode: (videoState) async {
            timerModel.startTimer();
            await videoState.startRecording();
          },
          onVideoRecordingMode: (videoState) async {
           // timerModel.
           timerModel.stopTimer();
            await videoState.stopRecording();
            Savefile.spnaic = false;
            Get.back();
          },
        );
      };
}

class CameraButtonPainter extends CustomPainter {
  CameraButtonPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var bgPainter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    var radius = size.width / 2;
    var center = Offset(size.width / 2, size.height / 2);
    bgPainter.color = Colors.white.withOpacity(.5);
    canvas.drawCircle(center, radius, bgPainter);

    bgPainter.color = Colors.white;
    canvas.drawCircle(center, radius - 8, bgPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VideoButtonPainter extends CustomPainter {
  final bool isRecording;

  VideoButtonPainter({
    this.isRecording = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var bgPainter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    var radius = size.width / 2;
    var center = Offset(size.width / 2, size.height / 2);
    bgPainter.color = Colors.white.withOpacity(.5);
    canvas.drawCircle(center, radius, bgPainter);

    if (isRecording) {
      bgPainter.color = Colors.red;
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(
                17,
                17,
                size.width - (17 * 2),
                size.height - (17 * 2),
              ),
              const Radius.circular(12.0)),
          bgPainter);
    } else {
      bgPainter.color = Colors.red;
      canvas.drawCircle(center, radius - 8, bgPainter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
