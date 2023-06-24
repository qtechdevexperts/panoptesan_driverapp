import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/videoController.dart';
import '../helpers/Colors.dart';
import 'carDetail.dart';
import 'homemain.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
    //videoController.getVideo();
    // getVideo();
  }

  final ImagePicker _picker = ImagePicker();

  void _pickVideo() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);

    if (mounted && file != null) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) => VideoEditor(file: File(file.path)),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    // double value =  _controller.value.duration as double;
    return Scaffold(

  appBar: AppBar(
            leadingWidth: 70,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Container(
                  width: 55,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: white),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/leading.svg',
                      color: Color(0xff005D99),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, setState) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.symmetric(
                                  vertical: 300,
                                  horizontal: 50,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.zero,
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    30.verticalSpace,
                                    Text(
                                      'Delete',
                                      style: GoogleFonts.inter(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: black,
                                      ),
                                    ),
                                    10.verticalSpace,
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Text(
                                        'Are you sure you want to delete',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff6C6C6C),
                                        ),
                                      ),
                                    ),
                                    30.verticalSpace,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => Get.back(),
                                            child: Container(
                                              height: 51,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5)),
                                                color: bprimary,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Cancel',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () =>
                                                Get.to(() => MainScreen()),
                                            child: Container(
                                              height: 51,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(5)),
                                                color: kprimary,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Delete',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Delete',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffE23939),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  GestureDetector(
                    onTap: () => _pickVideo(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Edit Video',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff667080),
                        ),
                      ),
                    ),
                  ),
                  5.horizontalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: SvgPicture.asset('assets/edit.svg'),
                  ),
                  20.horizontalSpace,
                ],
              )
            ],
          ),
        
      body: GetBuilder<VideoController>(
        builder: (_vdC) => 
           Container(
            child: Column(
              children: [
                20.verticalSpace,
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height: 574.h,
                      width: 388.w,
                      decoration: BoxDecoration(
                          color: black, borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: !_vdC.controller.value.isInitialized
                              ? Text('Loading...')
                              : AspectRatio(
                                  aspectRatio: _vdC.controller.value.aspectRatio,
                                  child: VideoPlayer(_vdC.controller),
                                )),
                    ),
                    Positioned(
                      bottom: 20,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          log('sdfsdf');
                          Get.to(() => CarDetailScreen());
                        },
                        child: Container(
                          height: 56.h,
                          width: 212.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kprimary),
                          child: Center(
                            child: Text(
                              'Fetch Car Details',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    ValueListenableBuilder(
                      valueListenable: _vdC.controller,
                      builder: (context, VideoPlayerValue value, child) {
    
    
    
    
                        //Do Something with the value.
                        return Expanded(
                          child: Slider.adaptive(
                            min: 0,
                            //  divisions: 100,
                            label: value.position.inMilliseconds
                                .toDouble()
                                .toString(),
                            activeColor: kprimary,
                            inactiveColor: kprimary,
                            value: value.position.inMilliseconds.toDouble(),
                            onChanged: (value) async {
                              if (_vdC.controller.value.isPlaying) {
                                await _vdC.controller.pause();
                                _vdC.update();
                              }
    
                              Duration duration =
                                  Duration(milliseconds: value.toInt());
    
                              await _vdC.controller.seekTo(duration);
                              _vdC.update();
                            },
                            //      min: 0.0,
                            max: value.duration.inMilliseconds.toDouble(),
                            onChangeStart: (value) {
                              // _vdC.controller.
                              //// var duration = Duration(seconds: value.toInt());
                              // _vdC.controller.seekTo(duration);
                              // _vdC.update();
                              // value = _vdC.controller!.value.position.inMicroseconds.toDouble();
                            },
                            onChangeEnd: (value) {
                              // var duration = Duration(seconds: value.toInt());
                              // _vdC.controller.seekTo(duration);
                              //  value = _vdC.controller!.value.position.inMicroseconds.toDouble();
                            },
                          ),
                        );
                      },
                    )
                    // Expanded(
                    //   child: Slider.adaptive(
                    //     activeColor: kprimary,
                    //     inactiveColor: kprimary,
                    //     value: _vdC.sliderValue,
                    //     onChanged: (value) async {
                    //       if (_vdC.controller.value.isPlaying) {
                    //         await _vdC.controller.pause();
                    //         _vdC.update();
                    //       }
                    //       print(value);
    
                    //       _vdC.sliderValue = value;
                    //       final Duration duration =
                    //           _vdC.controller.value.duration;
                    //       final newPosition = duration * value;
                    //       await _vdC.controller.seekTo(newPosition);
                    //       _vdC.update();
                    //     },
                    //     //      min: 0.0,
                    //     // max: _vdC.controller.value.,
                    //     onChangeStart: (value) {
                    //       // _vdC.controller.
                    //       //// var duration = Duration(seconds: value.toInt());
                    //       // _vdC.controller.seekTo(duration);
                    //       // _vdC.update();
                    //       // value = _vdC.controller!.value.position.inMicroseconds.toDouble();
                    //     },
                    //     onChangeEnd: (value) {
                    //       // var duration = Duration(seconds: value.toInt());
                    //       // _vdC.controller.seekTo(duration);
                    //       //  value = _vdC.controller!.value.position.inMicroseconds.toDouble();
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: kprimary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 10), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.skip_previous,
                            color: white,
                          ),
                          onPressed: () {
                            // code to play video
                          },
                        ),
                      ),
                    ),
                    7.horizontalSpace,
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 10), // changes position of shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: _vdC.controller.value.isPlaying
                            ? Icon(Icons.pause)
                            : Icon(Icons.play_arrow),
                        onPressed: () {
                          _vdC.controller.value.isPlaying
                              ? _vdC.controller.pause()
                              : _vdC.controller.play();
    
                          _vdC.update();
                        },
                      ),
                    ),
                    7.horizontalSpace,
                    Container(
                      decoration: BoxDecoration(
                        color: kprimary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 10), // changes position of shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.skip_next,
                          color: white,
                        ),
                        onPressed: () {
                          // code to play next video
                        },
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                GestureDetector(
                  onTap: () => Get.to(() => CarDetailScreen()),
                  child: Text(
                    'Verify Details',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kprimary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}












// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   // VideoPlayerController? videoPlayerController;
//   // Future<void>? videoPlayerFuture;

//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//     //  getVideo();
//   }

//   // getVideo() async {
//   //   videoPlayerController = await VideoPlayerController.network(
//   //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//   //   );
//   //   videoPlayerFuture = videoPlayerController?.initialize();
//   //   videoPlayerController?.setLooping(true);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying ? _controller.pause() : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );

//     // Scaffold(
//     //   backgroundColor: Colors.transparent,
//     //   appBar: AppBar(title: Text('Flutter Video Player Sample')),
//     //   body: FutureBuilder(
//     //     future: Future.value(getVideo()),
//     //     builder: (context, snapshot) {
//     //       if (snapshot.connectionState == ConnectionState.done) {
//     //         return AspectRatio(
//     //           aspectRatio: videoPlayerController!.value.aspectRatio,
//     //           child: VideoPlayer(videoPlayerController!),
//     //         );
//     //       } else {
//     //         return Center(child: CircularProgressIndicator());
//     //       }
//     //     },
//     //   ),
//     //   // floatingActionButton: FloatingActionButton(
//     //   //   onPressed: () {
//     //   //     setState(() {
//     //   //       videoPlayerController!.value.isPlaying ? videoPlayerController?.pause() : videoPlayerController?.play();
//     //   //     });
//     //   //   },
//     //   //   child: Icon(
//     //   //     videoPlayerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//     //   //   ),
//     //   // )
//     // );
//   }

//   @override
//   void dispose() {
//     // videoPlayerController?.dispose();
//     _controller.dispose();

//     super.dispose();
//   }
// }
