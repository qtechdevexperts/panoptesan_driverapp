import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panoptesan_alpha/helpers/Colors.dart';
import 'package:panoptesan_alpha/helpers/snackbar.dart';
import 'package:panoptesan_alpha/screens/Settings.dart';
import '../helpers/dialog/src/progress_dialog.dart';
import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';
import '../Widgets/crop.dart';
import '../Widgets/editVideo.dart';
import '../controllers/videoController.dart';
import '../widgets/RecordingButton.dart';
import 'home.dart';

class StartRecordingScreen extends StatefulWidget {
  const StartRecordingScreen({super.key});

  @override
  State<StartRecordingScreen> createState() => _StartRecordingScreenState();
}

class _StartRecordingScreenState extends State<StartRecordingScreen> {
  @override
  Widget build(BuildContext b) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(top: 280),
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 100.h,
      //         width: 100.w,
      //         decoration: BoxDecoration(
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.withOpacity(0.5),
      //               spreadRadius: 5,
      //               blurRadius: 7,
      //               offset: Offset(0, 3), // changes position of shadow
      //             ),
      //           ],
      //           shape: BoxShape.circle,
      //           color: black,
      //         ),
      //         child: Center(
      //             child: FaIcon(
      //           FontAwesomeIcons.solidCircle,
      //           color: white,
      //           size: 20,
      //         )),
      //       ),
      //       10.verticalSpace,
      //       Text(
      //         'Start Recording',
      //         style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.w400,
      //           color: black,
      //         ),
      //       )
      //     ],
      //   ),
      // ),

      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,

        // leading: GestureDetector(
        //   onTap: () => Get.back(),
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 20, bottom: 10),
        //     child: Container(
        //       width: 55,
        //       height: 50,
        //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
        //       child: Padding(
        //         padding: const EdgeInsets.all(16),
        //         child: SvgPicture.asset(
        //           'assets/leading.svg',
        //           color: Color(0xff005D99),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        centerTitle: true,
        title: SvgPicture.asset('assets/Group248.svg'),
        actions: [
          CircleIconButton(
            backgroundColor: Color(0xFF007AB6),
            icon: Icons.settings,
            iconColor: Colors.white,
            onPressed: () {
              Get.to(() => SettingsScreen());
            },
          ),
          20.horizontalSpace,
        ],
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoundedElevatedButton(
                onPressed: () async {
                  ProgressDialog progressDialog = ProgressDialog(context,
                      message: const Text("Please Wait....."),
                      title: const Text("Loading"));

                  final ImagePicker _picker = ImagePicker();
                  final XFile? file =
                      await _picker.pickVideo(source: ImageSource.camera);

                  //               VideoEditorController videoEditorController;

                  //       =     videoEditorController
                  //     .initialize(aspectRatio: 9 / 16)
                  //     .then((_) => setState(() {}))
                  //     .catchError((error) {
                  //   // handle minumum duration bigger than video duration error
                  //   Navigator.pop(context);
                  // }, test: (e) => e is VideoMinDurationError);
                  //               // Get.to(CropScreen(
                  //               //   controller: videoEditorController,
                  //               // ));

                  if (file != null) {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          insetPadding: horizontal40Padding,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: 0.h),
                          actionsPadding: EdgeInsets.zero,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              30.verticalSpace,
                              Text(
                                "Alert!",
                                style: GoogleFonts.inter(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: black),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "How would you like to continue?",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                              ),
                              SizedBox(height: 30.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        progressDialog.show();
                                        final VideoEditorController ctr =
                                            VideoEditorController.file(
                                                File(file.path),
                                                minDuration: 0.milliseconds,
                                                maxDuration: 10.milliseconds);

                                        await ctr.initialize(
                                            aspectRatio: 9 / 16);

                                        final videoInfo = FlutterVideoInfo();

                                        String videoFilePath = file.path;
                                        var info = await videoInfo
                                            .getVideoInfo(videoFilePath);

                                        await Get.to(VideoEditor(
                                          file: File(file.path),
                                          max: info!.duration!.toInt(),
                                          min: 1,
                                        ));

                                        try {
                                          var controller =
                                              Get.put(VideoController());

                                          await controller.uploadvideo(
                                              File(controller.file!.path));
                                          progressDialog.dismiss();
                                          await controller.setvideo();
                                          SnackbarWidget().showsnackbar(
                                              "Video Uploaded successfully",
                                              context);
                                          Get.back();
                                        } catch (e) {
                                          progressDialog.dismiss();
                                          SnackbarWidget().showsnackbar(
                                              e.toString(), context);
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                insetPadding:
                                                    horizontal40Padding,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0.w,
                                                        vertical: 0.h),
                                                actionsPadding: EdgeInsets.zero,
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    30.verticalSpace,

                                                    Text(
                                                      "Alert!",
                                                      style: GoogleFonts.inter(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: black),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Text(
                                                      "You cannot upload video right now, \n please buy storage package",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.inter(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: grey),
                                                    ),
                                                    SizedBox(height: 30.h),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                Get.back(),
                                                            child: Container(
                                                                width: 1.sw,
                                                                height: 51.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      bprimary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Close',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          white,
                                                                    ),
                                                                  ),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // CustomButton(
                                                    //   tap: () {
                                                    //     Get.to(() => MainScreen());
                                                    //   },
                                                    //   width: 1.sw,
                                                    //   height: 60.h,
                                                    //   ButtonText: 'Back to Home',
                                                    //   gradients: bprimaryColor,
                                                    // ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                          width: 1.sw,
                                          height: 51.h,
                                          decoration: BoxDecoration(
                                            color: bprimary,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Edit',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: white,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        progressDialog.show();

                                        try {
                                          var controller =
                                              Get.put(VideoController());

                                          await controller
                                              .uploadvideo(File(file.path));
                                          progressDialog.dismiss();
                                          await controller.setvideo();
                                          SnackbarWidget().showsnackbar(
                                              "Video Uploaded successfully",
                                              context);
                                          Get.back();
                                        } catch (e) {
                                          progressDialog.dismiss();
                                          SnackbarWidget().showsnackbar(
                                              e.toString(), context);
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                insetPadding:
                                                    horizontal40Padding,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0.w,
                                                        vertical: 0.h),
                                                actionsPadding: EdgeInsets.zero,
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    30.verticalSpace,

                                                    Text(
                                                      "Alert!",
                                                      style: GoogleFonts.inter(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: black),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Text(
                                                      "You cannot upload video right now, \n please buy storage package",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.inter(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: grey),
                                                    ),
                                                    SizedBox(height: 30.h),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                Get.back(),
                                                            child: Container(
                                                                width: 1.sw,
                                                                height: 51.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      bprimary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Close',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          white,
                                                                    ),
                                                                  ),
                                                                )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // CustomButton(
                                                    //   tap: () {
                                                    //     Get.to(() => MainScreen());
                                                    //   },
                                                    //   width: 1.sw,
                                                    //   height: 60.h,
                                                    //   ButtonText: 'Back to Home',
                                                    //   gradients: bprimaryColor,
                                                    // ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                          width: 1.sw,
                                          height: 51.h,
                                          decoration: BoxDecoration(
                                            color: kprimary,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Upload Online',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: white,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );

                    // VideoPlayerController controller =
                    //     await VideoPlayerController.file(File(file.path))
                    //       ..initialize();
                    // var duration = controller.value.duration;

                    // print(duration.inMilliseconds);
                    // final VideoEditorController ctr =
                    //     VideoEditorController.file(File(file.path),
                    //         minDuration: 0.milliseconds,
                    //         maxDuration: 10.milliseconds);

                    // await ctr.initialize(aspectRatio: 9 / 16);

                    // final videoInfo = FlutterVideoInfo();

                    // String videoFilePath = file.path;
                    // var info = await videoInfo.getVideoInfo(videoFilePath);

                    // Get.to(VideoEditor(
                    //   file: File(file.path),
                    //   max: info!.duration!.toInt(),
                    //   min: 1,
                    // ));
                  }
                },
                redheight: constraints.maxHeight * 0.14,
                redwidth: constraints.maxWidth * 0.25,
                whiteheight: constraints.maxHeight * 0.16,
                whitewidth: constraints.maxWidth * 0.04),
            // 200.verticalSpace,
            // GestureDetector(
            //     onTap: () async {
            //       final ImagePicker _picker = ImagePicker();
            //       final XFile? file =
            //           await _picker.pickVideo(source: ImageSource.camera);

            //       if (file != null) {
            //         ProgressDialog progressDialog = ProgressDialog(context,
            //             message: const Text("Please Wait....."),
            //             title: const Text("Loading"));

            //         progressDialog.show();

            //         try {
            //           var controller = Get.put(VideoController());

            //           await controller.uploadvideo(File(file.path));
            //           progressDialog.dismiss();
            //           await controller.setvideo();
            //           SnackbarWidget()
            //               .showsnackbar("Video Uploaded Successf", context);
            //         } catch (e) {
            //           progressDialog.dismiss();
            //         }
            //       }

            //       ///
            //       //    Get.to(VideoEditorExample());
            //     },
            //     child: RoundedElevatedButton(
            //       onPressed: () {},
            //     )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Start Recording',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.055,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.2,
            ),
          ],
        );
      }),
    );
  }
}
