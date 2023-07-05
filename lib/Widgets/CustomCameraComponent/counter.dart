import 'dart:async';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

// class CounterDuration extends StatefulWidget {
//   final CameraState state;
//   CounterDuration({required this.state});
//   @override
//   State<CounterDuration> createState() => _CounterDurationState();
// }

// class _CounterDurationState extends State<CounterDuration> {
//   TimerModel timerModel = TimerModel();

//   @override
//   void dispose() {
//     timerModel.stopTimer();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     timerModel.startTimer();
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     widget.state is VideoRecordingCameraState
//         ? 
//             ValueListenableBuilder<int>(
//               valueListenable: timerModel.timeElapsed,
//               builder: (context, value, child) {
//                 final minutes = (value ~/ 60).toString().padLeft(2, '0');
//                 final seconds = (value % 60).toString().padLeft(2, '0');
//                 return Text(
//                   '$minutes:$seconds',
//                   style: TextStyle(color: Colors.white),
//                 );
//               },
//             )
        
    
//         : Text("", style: TextStyle(color: Colors.white));
//   }
// }

class TimerModel {
  final ValueNotifier<int> timeElapsed = ValueNotifier<int>(0);
  Timer? _timer;

  void startTimer() {
    timeElapsed.value = 0;

    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      timeElapsed.value += 1;
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
