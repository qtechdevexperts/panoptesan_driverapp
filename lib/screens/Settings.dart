import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/screens/NewLoginScreen.dart';

import '../helpers/Colors.dart';
import '../helpers/localstorage.dart';
import 'AboutApp.dart';
import 'CarHistory.dart';
import 'Discailmer.dart';
import 'HelpSupport.dart';
import 'PrivacyPolicy.dart';
import 'TermsAndCondition.dart';
import 'home.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var switchnot = false;
  var switchnot1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.all(9.0),
          child: CircleIconButton(
            backgroundColor: Color(0xFF007AB6),
            icon: Icons.arrow_back,
            iconColor: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: appbarstyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            20.verticalSpace,
            Container(
              height: 70.h,
              width: 1.sw,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Notifications",
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            activeColor: kprimaryColor,
                            onChanged: (value) {
                              setState(
                                () {
                                  switchnot = value;
                                },
                              );
                            },
                            value: switchnot,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            15.verticalSpace,
            Container(
              height: 70.h,
              width: 1.sw,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Crash Detection",
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            activeColor: kprimaryColor,
                            onChanged: (value) {
                              setState(
                                () {
                                  switchnot1 = value;
                                },
                              );
                            },
                            value: switchnot1,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            15.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.to(() => AboutScreen());
              },
              child: Container(
                height: 70.h,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Row(
                    children: [
                      Text(
                        "About App",
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            15.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.to(() => PrivacyPolicyScreen());
              },
              child: Container(
                height: 70.h,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Row(
                    children: [
                      Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            15.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.to(() => TermsAndConditionScreen());
              },
              child: Container(
                height: 70.h,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Row(
                    children: [
                      Text(
                        "Terms & Condiciton",
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            15.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.to(() => DisclaimerScreen());
              },
              child: Container(
                height: 70.h,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Row(
                    children: [
                      Text(
                        "Disclaimer",
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //  15.verticalSpace,
            // GestureDetector(
            //   onTap: () {
            //     Get.to(() => CarHistoryScreen());
            //   },
            //   child: Container(
            //     height: 70.h,
            //     width: Get.width * 0.9,
            //     decoration: BoxDecoration(
            //       color: white,
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //     child: Padding(
            //       padding: EdgeInsets.only(left: 25.w),
            //       child: Row(
            //         children: [
            //           Text(
            //             "Verified History",
            //             style: TextStyle(
            //               color: black,
            //               fontSize: 15,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            15.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.to(() => HelpSupportScreen());
              },
              child: Container(
                height: 70.h,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Row(
                    children: [
                      Text(
                        "Help & Support",
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            15.verticalSpace,
            GestureDetector(
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
                            "Logout",
                            style: GoogleFonts.inter(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: black),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Are you sure you want\n to logout",
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
                                  onTap: () async {
                                    // setState(() {
                                    //   signUp = false;
                                    // });
                                    await LocalStorage.prefs?.clear();
                                    await Get.offAll(NewLoginScreen());

                                    // Get.to(() => LoginScreen());
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
                                          'Logout',
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
              child: Container(
                height: 65.h,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    15.horizontalSpace,
                    FaIcon(Icons.exit_to_app, color: white, size: 25),
                    5.horizontalSpace,
                    Text(
                      "Logout",
                      style: GoogleFonts.inter(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
