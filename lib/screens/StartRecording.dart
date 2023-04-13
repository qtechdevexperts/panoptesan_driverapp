import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/screens/Settings.dart';
import 'package:panoptesan_alpha/screens/VidCall.dart';
import 'package:panoptesan_alpha/videos.dart';

class StartRecordingScreen extends StatefulWidget {
  const StartRecordingScreen({super.key});

  @override
  State<StartRecordingScreen> createState() => _StartRecordingScreenState();
}

class _StartRecordingScreenState extends State<StartRecordingScreen> {
  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
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
      body: Container(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            200.verticalSpace,
            GestureDetector(
              onTap: () => Get.to(() => VidCallScreen()),
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Center(
                    child: FaIcon(
                  FontAwesomeIcons.solidCircle,
                  color: white,
                  size: 20,
                )),
              ),
            ),
            10.verticalSpace,
            Text(
              'Start Recording',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
