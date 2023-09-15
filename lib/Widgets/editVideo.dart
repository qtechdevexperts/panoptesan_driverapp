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
import 'package:panoptesan_alpha/helpers/alerts.dart';
import 'package:panoptesan_alpha/screens/home.dart';

import 'package:video_editor/video_editor.dart';

import '../controllers/BottomController.dart';
import '../helpers/Colors.dart';

import '../screens/homemain.dart';
import 'HomeVideoCard.dart';
import 'SquareIconButton.dart';
import 'crop.dart';

import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart' as pr;

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
  final String videoid;
  const VideoEditor(
      {required this.file,
      required this.max,
      required this.min,
      required this.videoid});

  @override
  State<VideoEditor> createState() => _VideoEditorState();
}

class _VideoEditorState extends State<VideoEditor> {
  //final _exportingProgress = ValueNotifier<double>(0.0);
  //final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;

  late VideoEditorController _controller = VideoEditorController.file(
    widget.file,
    minDuration: Duration(seconds: widget.min),
    maxDuration: Duration(seconds: widget.max),
  );
  final bottomcontroller = Get.put(VideoController());
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
    //  _exportingProgress.dispose();
    //  _isExporting.dispose();
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
    var pl = pr.ProgressDialog(context,
        type: pr.ProgressDialogType.download,
        isDismissible: true,
        showLogs: true);
    pl.show();
    //  _exportingProgress.value = 0;
    //  _isExporting.value = true;
    // NOTE: To use `-crf 1` and [VideoExportPreset] you need `ffmpeg_kit_flutter_min_gpl` package (with `ffmpeg_kit` only it won't work)

    try {
      await _controller.exportVideo(
        // preset: VideoExportPreset.medium,
        // customInstruction: "-crf 17",
        onProgress: (stats, value) {
          var val = value * 100;

          var str = val.toStringAsFixed(0);

          pl.update(progress: double.parse(str));
        },
        onError: (e, s) {
          throw (e);
        },
        onCompleted: (file) async {
          bottomcontroller.file = File(file.path);
          pl.hide();
          await Alert()
              .showalertwithmessage("Edit Completed", context)
              .then((value) => Get.back(result: true));
        },
      );
    } catch (e) {
      Alert()
          .showalertwithmessage("Error failed to edit file", context)
          .then((value) => Get.back(result: false));
      pl.hide();
    }

    //
    //
    //     .then((value) => Get.back());

// Get.back();
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
                onTap: () async {
                  // _exportVideo().then((value) {
                  //   Get.back();
                  // });
                  await _exportVideo();
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
                        SizedBox(
                          height: constraint.maxHeight * 0.05,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                height: constraint.maxHeight * 0.5,
                                width: constraint.maxWidth / 2,
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

                         SizedBox(
                          height: constraint.maxHeight * 0.05,
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
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CropScreen(controller: _controller),
                                      ),
                                    );

                                    // if (file != null) {
                                    //   setState(() {

                                    //   });
                                    //   _controller = VideoEditorController.file(
                                    //     file,
                                    //     minDuration:
                                    //         Duration(seconds: widget.min),
                                    //     maxDuration:
                                    //         Duration(seconds: widget.max),
                                    //   );
                                    //   _controller
                                    //       .initialize(aspectRatio: 9 / 16)
                                    //       .then((_) => setState(() {}))
                                    //       .catchError((error) {
                                    //     // handle minumum duration bigger than video duration error
                                    //     Navigator.pop(context);
                                    //   },
                                    //           test: (e) =>
                                    //               e is VideoMinDurationError);

                                    // }
                                  },
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
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       left: constraint.maxWidth * 0.08, top: 20),
                        //   child: Align(
                        //     alignment: Alignment.topLeft,
                        //     child: SquareIconButton(
                        //       squareSize: constraint.maxWidth * 0.12,
                        //       onPressed: () {
                        //         Get.to(CropScreen(controller: _controller));
                        //       },
                        //       icon: Icons.crop_free_outlined,
                        //     ),
                        //   ),
                        // ),
                        // ValueListenableBuilder(
                        //   valueListenable: _isExporting,
                        //   builder: (_, bool export, __) => OpacityTransition(
                        //     visible: export,
                        //     child: AlertDialog(
                        //       title: ValueListenableBuilder(
                        //         valueListenable: _exportingProgress,
                        //         builder: (_, double value, __) => Text(
                        //           "Exporting video ${(value * 100).ceil()}%",
                        //           style: const TextStyle(fontSize: 12),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
