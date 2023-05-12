import 'package:camera/camera.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
import 'package:panoptesan_alpha/controller/CameraController.dart';
import 'package:panoptesan_alpha/editVideo.dart';
import 'package:panoptesan_alpha/mainFolder/homemain.dart';

import '../Helper/Colors.dart';

class VidCallScreen extends StatefulWidget {
  const VidCallScreen({super.key});

  @override
  State<VidCallScreen> createState() => _VidCallScreen();
}

class _VidCallScreen extends State<VidCallScreen> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image
  int counter = 0;

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![counter], ResolutionPreset.max);
      counter = 1;
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;
    final cameractrl = Get.put(CameraGetController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  insetPadding: horizontal40Padding,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  actionsPadding: EdgeInsets.zero,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      30.verticalSpace,

                      Text(
                        "Discard",
                        style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: black),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Are you sure you want\n to leave",
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
                              onTap: () => Get.back(),
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
                                      'Cancel',
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
                              onTap: () => Get.to(() => MainScreen()),
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
                                      'Discard',
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
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Center(
                  child: Icon(Icons.close)), // x icon in center of container
            ),
          ),
        ),
        // SvgPicture.asset(
        //   "assets/redcross.svg",
        //   height: 25,
        // ),
        actions: [
          GestureDetector(
            onTap: () {
              // showmodalbottom sheet white color with 300 height and radius of 20 only top left and right with title as text and two buttons
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 300.0,
                      width: 0.9.sw,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          40.verticalSpace,
                          Text(
                            'Save as',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ), // Title Text Here
                          SizedBox(
                              height: 20.0), // Space Between Title and Buttons

                          CustomButton(
                            tap: () {},
                            ButtonText: "Phone Storage",
                            width: 0.9.sw,
                            textColor: white,
                            colors: bprimary,
                            height: 56.h,
                          ),
                          15.verticalSpace,
                          CustomButton(
                            tap: () {
                              Get.back();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    insetPadding: horizontal40Padding,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0.w, vertical: 0.h),
                                    actionsPadding: EdgeInsets.zero,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        30.verticalSpace,

                                        Text(
                                          "Congrats",
                                          style: GoogleFonts.inter(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700,
                                              color: black),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          "Videos have been saved\n successfully",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: grey),
                                        ),
                                        SizedBox(height: 20.h),
                                        Container(
                                          height: 180,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  roadpics[1],
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                          child: Center(
                                            child: FaIcon(
                                              FontAwesomeIcons.solidCircleCheck,
                                              color: Colors.green,
                                              size: 30,
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 20.h),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () => Get.back(),
                                                child: Container(
                                                    width: 1.sw,
                                                    height: 51.h,
                                                    decoration: BoxDecoration(
                                                      color: bprimary,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                5.0),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Go Back',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: white,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                //  onTap: () => Get.to(() => VideoEditorExample()),
                                                child: Container(
                                                    width: 1.sw,
                                                    height: 51.h,
                                                    decoration: BoxDecoration(
                                                      color: kprimary,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(
                                                                5.0),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Edit Video',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: white,
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
                            },
                            ButtonText: "Upload Online",
                            width: 0.9.sw,
                            textColor: white,
                            colors: kprimary,
                            height: 56.h,
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: 30.0,
                height: 30.0,
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
                    child: Icon(Icons.check)), // x icon in center of container
              ),
            ),
          ),
          10.horizontalSpace,
        ],
      ),
      // container with x icon in center with 5 border raduis
      body: Container(
        width: double.infinity,
        child: Container(
          height: 1.sh,
          width: 1.sw,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Container(
                  height: res_height,
                  width: 400,
                  child: controller == null
                      ? Center(child: Text("Loading Camera..."))
                      : !controller!.value.isInitialized
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : CameraPreview(controller!)),
              // Positioned(
              //   top: 40,
              //   right: 10,
              //   child: Image.asset(
              //     // "assets/Mask Group 18.png",
              //   ),
              // ),
              Positioned(
                bottom: 50,
                child: Container(
                  width: 0.68.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: FaIcon(
                            FontAwesomeIcons.pause,
                            color: grey,
                            size: 35,
                          )),
                        ),
                      ),
                      10.horizontalSpace,
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                            child: FaIcon(
                          FontAwesomeIcons.solidCircle,
                          color: white,
                          size: 15,
                        )),
                      ),
                    ],
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
