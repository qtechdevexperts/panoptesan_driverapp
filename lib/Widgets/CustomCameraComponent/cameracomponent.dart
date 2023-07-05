import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CameraComponent extends StatelessWidget {
  final CameraState state;
  final Widget middleContent;
  final Widget topActions;
  final Widget bottomActions;

  CameraComponent({
    super.key,
    required this.state,
    OnMediaTap? onMediaTap,
    Widget? middleContent,
    Widget? topActions,
    Widget? bottomActions,
  })  : middleContent = middleContent ??
            (Column(
              children: [
                const Spacer(),
                if (state.captureMode == CaptureMode.photo)
                  AwesomeFilterWidget(state: state)
                else if (!kIsWeb && Platform.isAndroid)
                  Container(),
                AwesomeCameraModeSelector(state: state),
              ],
            )),
        topActions = topActions ?? AwesomeTopActions(state: state),
        bottomActions = bottomActions ??
            AwesomeBottomActions(state: state, onMediaTap: onMediaTap);

  @override
  Widget build(BuildContext context) {
    final theme = AwesomeThemeProvider.of(context).theme;
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          topActions,
          Expanded(child: middleContent),
          Container(
            color: theme.bottomActionsBackgroundColor,
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  bottomActions,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}