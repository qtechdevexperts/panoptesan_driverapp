import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpers/helpers.dart' show OpacityTransition;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:panoptesan_alpha/Widgets/videoeditwidet.dart';
import 'package:panoptesan_alpha/controllers/videoController.dart';
import 'package:panoptesan_alpha/screens/home.dart';

import 'package:video_editor/video_editor.dart';

import '../controllers/BottomController.dart';
import '../helpers/Colors.dart';
import '../screens/homemain.dart';
import 'HomeVideoCard.dart';
import 'SquareIconButton.dart';
import 'crop.dart';

class TransparentPlayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TransparentPlayButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.play_arrow,
        size: 32,
        color: Color(0xFF007AB6),
      ),
      color: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}

//-------------------//
//VIDEO EDITOR SCREEN//
//-------------------//
class VideoEditor extends StatefulWidget {
  final File file;
  final int max;
  final int min;
  const VideoEditor({required this.file, required this.max, required this.min});

  @override
  State<VideoEditor> createState() => _VideoEditorState();
}

class _VideoEditorState extends State<VideoEditor> {
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;

  late final VideoEditorController _controller = VideoEditorController.file(
    widget.file,
    minDuration: Duration(seconds: widget.min),
    maxDuration: Duration(seconds: widget.max),
  );

  @override
  void initState() {
    super.initState();
    _controller
        .initialize(aspectRatio: 9 / 16)
        .then((_) => setState(() {}))
        .catchError((error) {
      // handle minumum duration bigger than video duration error
      Navigator.pop(context);
    }, test: (e) => e is VideoMinDurationError);
  }

  @override
  void dispose() {
    _exportingProgress.dispose();
    _isExporting.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _showErrorSnackBar(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 1),
        ),
      );

  Future<void> _exportVideo() async {
    _exportingProgress.value = 0;
    _isExporting.value = true;
    // NOTE: To use `-crf 1` and [VideoExportPreset] you need `ffmpeg_kit_flutter_min_gpl` package (with `ffmpeg_kit` only it won't work)
    await _controller.exportVideo(
      // preset: VideoExportPreset.medium,
      // customInstruction: "-crf 17",
      onProgress: (stats, value) => _exportingProgress.value = value,
      onError: (e, s) => _showErrorSnackBar("Error on export video :("),
      onCompleted: (file) {
        _isExporting.value = false;
        if (!mounted) return;
        final bottomcontroller = Get.put(VideoController());
        //   bottomcontroller.navBarChange(0);
        //    Get.to(() => MainScreen());

        bottomcontroller.file = File(file.path);
        Get.back();
        // showDialog(context: context, builder: (_) => VideoResultPopup(video: file));

        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10)),
        //         insetPadding: horizontal40Padding,
        //         contentPadding:
        //             EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        //         actionsPadding: EdgeInsets.zero,
        //         content: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             30.verticalSpace,

        //             Text(
        //               "Congrats",
        //               style: GoogleFonts.inter(
        //                   fontSize: 30,
        //                   fontWeight: FontWeight.w700,
        //                   color: black),
        //             ),
        //             SizedBox(height: 10.h),
        //             Text(
        //               "Videos have been saved\n successfully",
        //               textAlign: TextAlign.center,
        //               style: GoogleFonts.inter(
        //                   fontSize: 17, fontWeight: FontWeight.w400, color: grey),
        //             ),
        //             SizedBox(height: 20.h),
        //             Container(
        //               width: 200.w,
        //               height: 180.h,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(5),
        //                 image: DecorationImage(
        //                     image: AssetImage(
        //                       roadpics[1],
        //                     ),
        //                     fit: BoxFit.cover),
        //               ),
        //               child: Center(
        //                 child: FaIcon(
        //                   FontAwesomeIcons.solidCircleCheck,
        //                   color: Color(0xff44B241),
        //                   size: 50,
        //                 ),
        //               ),
        //             ),
        //             30.verticalSpace,
        //             GestureDetector(
        //               onTap: () {

        //                 Get.back();
        //               },
        //               child: Container(
        //                   width: 1.sw,
        //                   height: 51.h,
        //                   decoration: BoxDecoration(
        //                     color: kprimary,
        //                     borderRadius: BorderRadius.only(
        //                       bottomLeft: Radius.circular(5.0),
        //                       bottomRight: Radius.circular(5.0),
        //                     ),
        //                   ),
        //                   child: Center(
        //                     child: Text(
        //                       'Go Back',
        //                       style: TextStyle(
        //                         fontSize: 18,
        //                         fontWeight: FontWeight.bold,
        //                         color: white,
        //                       ),
        //                     ),
        //                   )),
        //             ),
        //             // CustomButton(
        //             //   tap: () {
        //             //     Get.to(() => MainScreen());
        //             //   },
        //             //   width: 1.sw,
        //             //   height: 60.h,
        //             //   ButtonText: 'Back to Home',
        //             //   gradients: bprimaryColor,
        //             // ),
        //           ],
        //         ),
        //       );
        //     },
        //   );
      },
    );
  }

  void _exportCover() async {
    await _controller.extractCover(
      onError: (e, s) => _showErrorSnackBar("Error on cover exportation :("),
      onCompleted: (cover) {
        if (!mounted) return;

        showDialog(
          context: context,
          builder: (_) => CoverResultPopup(cover: cover),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 70,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleIconButton(
                  icon: Icons.arrow_back,
                  backgroundColor: Color(0XFF007AB6),
                  iconColor: Colors.white,
                  onPressed: () {
                    Get.back();
                  }),
            ),
            centerTitle: true,
            title: Text(
              DateFormat.MMMMEEEEd().format(DateTime.now()),
              style: appbarstyle,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  // _exportVideo().then((value) {
                  //   Get.back();
                  // });
                  _exportVideo();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: 27.0,
                    height: 27.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 0,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                        child:
                            Icon(Icons.check)), // x icon in center of container
                  ),
                ),
              ),
              20.horizontalSpace,
            ],
          ),
          backgroundColor: Color(0xffF1F2F6),
          body: _controller.initialized
              ? SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                height: constraint.maxHeight / 2,
                                width: constraint.maxWidth * 0.8,
                                child: CropGridViewer.preview(
                                    controller: _controller)),
                            AnimatedBuilder(
                              animation: _controller.video,
                              builder: (_, __) => OpacityTransition(
                                visible: !_controller.isPlaying,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (_controller.isPlaying) {
                                      await _controller.video.pause();
                                    } else {
                                      await _controller.video.play();
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SafeArea(
                          child: SizedBox(
                            height: height,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Expanded(
                                //   child: IconButton(
                                //     color: white,
                                //     onPressed: () => Navigator.of(context).pop(),
                                //     icon: const Icon(
                                //       Icons.exit_to_app,
                                //       color: kprimary,
                                //     ),
                                //     tooltip: 'Leave editor',
                                //   ),
                                // ),
                                // const VerticalDivider(
                                //   endIndent: 22,
                                //   indent: 22,
                                //   color: kprimary,
                                // ),
                                AnimatedBuilder(
                                  animation: Listenable.merge([
                                    _controller,
                                    _controller.video,
                                  ]),
                                  builder: (_, __) {
                                    final duration =
                                        _controller.videoDuration.inSeconds;
                                    final pos =
                                        _controller.trimPosition * duration;

                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: height / 4),
                                      child: Row(children: [
                                        Text(formatter(
                                            Duration(seconds: pos.toInt()))),
                                        //const Expanded(child: SizedBox()),
                                        OpacityTransition(
                                          visible: _controller.isTrimming,
                                          child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(formatter(
                                                    _controller.startTrim)),
                                                const SizedBox(width: 10),
                                                Text(formatter(
                                                    _controller.endTrim)),
                                              ]),
                                        ),
                                      ]),
                                    );
                                  },
                                ),
                                IconButton(
                                  color: white,
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (context) =>
                                          CropScreen(controller: _controller),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.crop,
                                    color: kprimary,
                                  ),
                                  tooltip: 'Open crop screen',
                                ),
                                IconButton(
                                  onPressed: () async {
                                    if (_controller.isPlaying) {
                                      await _controller.video.pause();
                                    } else {
                                      await _controller.video.play();
                                    }
                                    setState(() {});
                                  },
                                  icon: _controller.isPlaying
                                      ? Icon(
                                          Icons.pause,
                                          size: 32,
                                          color: Color(0xFF007AB6),
                                        )
                                      : Icon(
                                          Icons.play_arrow,
                                          size: 32,
                                          color: Color(0xFF007AB6),
                                        ),
                                  color: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                ),
                                // const VerticalDivider(
                                //     endIndent: 22, indent: 22),
                                // Expanded(
                                //   child: PopupMenuButton(
                                //     tooltip: 'Open export menu',
                                //     icon: Icon(
                                //       Icons.save,
                                //       color: kprimary,
                                //     ),
                                //     itemBuilder: (context) => [
                                //       PopupMenuItem(
                                //         onTap: _exportCover,
                                //         child: Text('Export cover',
                                //             style: TextStyle(
                                //               color: black,
                                //             )),
                                //       ),
                                //       PopupMenuItem(
                                //         onTap: _exportVideo,
                                //         child: Text(
                                //           'Export video',
                                //           style: TextStyle(
                                //             color: black,
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),

                                IconButton(
                                  color: white,
                                  onPressed: () => _controller
                                      .rotate90Degrees(RotateDirection.left),
                                  icon: SvgPicture.asset(
                                    'assets/arrowCurveleft.svg',
                                    color: kprimary,
                                  ),
                                  tooltip: 'Rotate unclockwise',
                                ),
                                IconButton(
                                  color: white,
                                  onPressed: () => _controller
                                      .rotate90Degrees(RotateDirection.right),
                                  icon: SvgPicture.asset(
                                    'assets/arrowCurveRight.svg',
                                    color: kprimary,
                                  ),
                                  tooltip: 'Rotate clockwise',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: constraint.maxWidth * 0.08),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Mute clip audio",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraint.maxWidth * 0.04),
                            ),
                          ),
                        ),
                        Container(
                          //  height: 200,
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SquareIconButton(
                                    squareSize: constraint.maxWidth * 0.12,
                                    onPressed: () {},
                                    icon: Icons.volume_down,
                                  ),
                                  SizedBox(
                                    width: constraint.maxWidth * 0.05,
                                  ),
                                  Container(
                                    color: bprimary,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 2),
                                    child: TrimSlider(
                                      hasHaptic: true,
                                      controller: _controller,
                                      height: height,
                                      //   horizontalMargin: height / 4,
                                      child: TrimTimeline(
                                        controller: _controller,
                                        padding: const EdgeInsets.only(top: 10),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: constraint.maxWidth * 0.08, top: 20),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Mute clip audio",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraint.maxWidth * 0.04),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: constraint.maxWidth * 0.08, top: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SquareIconButton(
                              squareSize: constraint.maxWidth * 0.12,
                              onPressed: () {
                                Get.to(CropScreen(controller: _controller));
                              },
                              icon: Icons.crop_free_outlined,
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: _isExporting,
                          builder: (_, bool export, __) => OpacityTransition(
                            visible: export,
                            child: AlertDialog(
                              title: ValueListenableBuilder(
                                valueListenable: _exportingProgress,
                                builder: (_, double value, __) => Text(
                                  "Exporting video ${(value * 100).ceil()}%",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      );
    });
  }

  Widget _topNavBar() {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            // Expanded(
            //   child: IconButton(
            //     color: white,
            //     onPressed: () => Navigator.of(context).pop(),
            //     icon: const Icon(
            //       Icons.exit_to_app,
            //       color: kprimary,
            //     ),
            //     tooltip: 'Leave editor',
            //   ),
            // ),
            // const VerticalDivider(
            //   endIndent: 22,
            //   indent: 22,
            //   color: kprimary,
            // ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                size: 32,
                color: Color(0xFF007AB6),
              ),
              color: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            IconButton(
              color: white,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => CropScreen(controller: _controller),
                ),
              ),
              icon: const Icon(
                Icons.crop,
                color: kprimary,
              ),
              tooltip: 'Open crop screen',
            ),
            //  const VerticalDivider(endIndent: 22, indent: 22),
            // Expanded(
            //   child: PopupMenuButton(
            //     tooltip: 'Open export menu',
            //     icon: Icon(
            //       Icons.save,
            //       color: kprimary,
            //     ),
            //     itemBuilder: (context) => [
            //       PopupMenuItem(
            //         onTap: _exportCover,
            //         child: Text('Export cover',
            //             style: TextStyle(
            //               color: black,
            //             )),
            //       ),
            //       PopupMenuItem(
            //         onTap: _exportVideo,
            //         child: Text(
            //           'Export video',
            //           style: TextStyle(
            //             color: black,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            IconButton(
              color: white,
              onPressed: () =>
                  _controller.rotate90Degrees(RotateDirection.left),
              icon: SvgPicture.asset(
                'assets/arrowCurveleft.svg',
                color: kprimary,
              ),
              tooltip: 'Rotate unclockwise',
            ),
            IconButton(
              color: white,
              onPressed: () =>
                  _controller.rotate90Degrees(RotateDirection.right),
              icon: SvgPicture.asset(
                'assets/arrowCurveRight.svg',
                color: kprimary,
              ),
              tooltip: 'Rotate clockwise',
            ),
          ],
        ),
      ),
    );
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _controller.video,
        ]),
        builder: (_, __) {
          final duration = _controller.videoDuration.inSeconds;
          final pos = _controller.trimPosition * duration;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 4),
            child: Row(children: [
              Text(formatter(Duration(seconds: pos.toInt()))),
              const Expanded(child: SizedBox()),
              OpacityTransition(
                visible: _controller.isTrimming,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(formatter(_controller.startTrim)),
                  const SizedBox(width: 10),
                  Text(formatter(_controller.endTrim)),
                ]),
              ),
            ]),
          );
        },
      ),
      Row(
        children: [
          // SquareIconButton(
          //   squareSize: constraint.maxWidth * 0.2,
          //   onPressed: () {},
          //   icon: Icons.folder,
          // ),
          Container(
            color: bprimary,
            width: MediaQuery.of(context).size.width / 1.5,
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: TrimSlider(
              hasHaptic: true,
              controller: _controller,
              height: height,
              //   horizontalMargin: height / 4,
              child: TrimTimeline(
                controller: _controller,
                padding: const EdgeInsets.only(top: 10),
              ),
            ),
          ),
        ],
      )
    ];
  }

  Widget _coverSelection() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: CoverSelection(
            controller: _controller,
            size: height + 10,
            quantity: 8,
            selectedCoverBuilder: (cover, size) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  cover,
                  Icon(
                    Icons.check_circle,
                    color: const CoverSelectionStyle().selectedBorderColor,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
