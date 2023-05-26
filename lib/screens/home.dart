import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/controller/BottomController.dart';

import 'package:panoptesan_alpha/screens/Archive.dart';
import 'package:panoptesan_alpha/screens/SOSMessageScreen.dart';
import 'package:panoptesan_alpha/screens/Settings.dart';
import 'package:panoptesan_alpha/videos.dart';

import '../controller/videoController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bt = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            Get.to(() => SOSMessageScreen());
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 120, right: 20),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/panic.svg'),
              ),
              height: 56.h,
              width: 150.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
          ),
        ),
      ),
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
        title: Text(
          'Home',
          style: appbarstyle,
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => SettingsScreen()),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Container(
                width: 55,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: white),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/setting.svg',
                    color: Color(0xff005D99),
                  ),
                ),
              ),
            ),
          ),
          20.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: horizontal20Padding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              40.verticalSpace,
              Text(
                'Recent Videos',
                style: GoogleFonts.inter(
                    fontSize: 28, fontWeight: FontWeight.w800, color: kprimary),
              ),
              15.verticalSpace,
              Container(
                width: 1.sw,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        ProgressDialog progressDialog = ProgressDialog(context,
                            message: const Text("Please Wait....."),
                            title: const Text("Loading"));

                        progressDialog.show();
                        try {
                          var controller = Get.put(VideoController());
                          await controller.getVideo();
                          progressDialog.dismiss();
                          await Get.to(() => VideoScreen());
                        } catch (e) {
                          progressDialog.dismiss();
                        }
                      },
                      child: Container(
                        height: 190,
                        width: 190,
                        decoration: BoxDecoration(
                          color: reddishColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          image: DecorationImage(
                            image: AssetImage(roadpics[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      if (bt.navigationBarIndexValue != 1) {
                                        bt.navBarChange(1);
                                      } else {
                                        Get.back();
                                      }
                                    },
                                    child: Container(
                                      child:
                                          SvgPicture.asset('assets/folder.svg'),
                                    ),
                                  ),
                                  15.horizontalSpace,
                                  SvgPicture.asset('assets/download.svg'),
                                  15.horizontalSpace,
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              insetPadding: horizontal40Padding,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20.w,
                                                      vertical: 0.h),
                                              actionsPadding: EdgeInsets.zero,
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  20.verticalSpace,
                                                  GestureDetector(
                                                    onTap: () => Get.back(),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: FaIcon(
                                                        FontAwesomeIcons.x,
                                                        color: Colors.red,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  20.verticalSpace,
                                                  Text(
                                                    "Share",
                                                    style: GoogleFonts.inter(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: black),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                          'assets/fbshare.svg'),
                                                      SvgPicture.asset(
                                                          'assets/ig.svg'),
                                                      SvgPicture.asset(
                                                          'assets/twitter.svg'),
                                                    ],
                                                  ),
                                                  25.verticalSpace,
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                          child: SvgPicture.asset(
                                              'assets/share.svg'))),
                                ],
                              ),
                              Expanded(
                                child: Center(
                                  child:
                                      SvgPicture.asset('assets/videocam.svg'),
                                ),
                              ),
                              Text(
                                '11/15/2022',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16,
                                    color: white),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
