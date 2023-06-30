import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

import 'bottomcaputurebutton.dart';


class CameraBottomActions extends StatelessWidget {
  final CameraState state;
  final Widget left;
  final Widget right;
  final Widget captureButton;
  final EdgeInsets padding;

  CameraBottomActions({
    super.key,
    required this.state,
    Widget? left,
    Widget? right,
    Widget? captureButton,
    OnMediaTap? onMediaTap,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  })  : captureButton = captureButton ?? BottomCapture(
          state: state,
        ),
        left = left ??
            (state is VideoRecordingCameraState
                ? AwesomePauseResumeButton(
                    state: state,
                  )
                : Builder(builder: (context) {
                    final theme = AwesomeThemeProvider.of(context).theme;
                    return AwesomeCameraSwitchButton(
                      state: state,
                      theme: theme.copyWith(
                        buttonTheme: theme.buttonTheme.copyWith(
                          backgroundColor: Colors.white12,
                        ),
                      ),
                    );
                  })),
        right = right ??
            (state is VideoRecordingCameraState
                ? const SizedBox(width: 48)
                : StreamBuilder<MediaCapture?>(
                    stream: state.captureState$,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const SizedBox(width: 60, height: 60);
                      }
                      return SizedBox(
                        width: 60,
                        child: AwesomeMediaPreview(
                          mediaCapture: snapshot.requireData,
                          onMediaTap: onMediaTap,
                        ),
                      );
                    },
                  ));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: left,
            ),
          ),
          captureButton,
          Expanded(
            child: Center(
              child: right,
            ),
          ),
        ],
      ),
    );
  }
}
