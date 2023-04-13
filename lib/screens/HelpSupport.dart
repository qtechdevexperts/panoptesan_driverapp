import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
import 'package:panoptesan_alpha/Widgets/textfield.dart';
import 'package:panoptesan_alpha/screens/AboutApp.dart';
import 'package:panoptesan_alpha/screens/Discailmer.dart';
import 'package:panoptesan_alpha/screens/PrivacyPolicy.dart';
import 'package:panoptesan_alpha/screens/Settings.dart';
import 'package:panoptesan_alpha/screens/TermsAndCondition.dart';
import 'package:panoptesan_alpha/screens/carDetail.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  var switchnot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Container(
              width: 55,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
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
        centerTitle: true,
        title: Text(
          "Help & Support",
          style: appbarstyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'Call Now (+1) 123456789',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kprimary,
                ),
              ),
              20.verticalSpace,
              Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing, elit congue nisi rutrum platea lacinia sapien, sed vel cras torquent scelerisque. Tempus pharetra quam congue natoque aptent sollicitudin et bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: grey,
                ),
              ),
              30.verticalSpace,
              Text(
                "Name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              6.verticalSpace,
              CustomTextField(
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                fillcolor: white,
                hintText: 'Type your full name...',
                underlineColor: white,
                hintColor: grey,
                widthh: 0.9.sw,
              ),
              20.verticalSpace,
              Text(
                "Email",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              6.verticalSpace,
              CustomTextField(
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                fillcolor: white,
                hintText: 'Type your email...',
                underlineColor: white,
                hintColor: grey,
                widthh: 0.9.sw,
              ),
              20.verticalSpace,
              Text(
                "Message",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              6.verticalSpace,
              CustomTextField(
                maxline: 4,
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                fillcolor: white,
                hintText: 'Type your message...',
                underlineColor: white,
                hintColor: grey,
                widthh: 0.9.sw,
              ),
              20.verticalSpace,
              CustomButton(
                tap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        insetPadding: horizontal20Padding,
                        contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                        actionsPadding: EdgeInsets.zero,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            40.verticalSpace,
                            // Container(
                            //   child: SvgPicture.asset(
                            //     "assets/checkCircle.svg",
                            //     color: bprimary,
                            //   ),
                            // ),
                            FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Color(0xff44B241),
                              size: 100,
                            ),
                            10.verticalSpace,
                            Text(
                              "Request Submitted",
                              style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.w700, color: black),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "your message has been\n submitted successfully",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w400, color: grey),
                            ),
                            SizedBox(height: 30.h),

                            GestureDetector(
                              onTap: () => Get.to(() => SettingsScreen()),
                              child: Container(
                                  width: 1.sw,
                                  height: 51.h,
                                  decoration: BoxDecoration(
                                    color: kprimary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Go Back',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: white,
                                      ),
                                    ),
                                  )),
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
                ButtonText: "Submit",
                width: 1.sw,
                textColor: white,
                colors: kprimary,
                height: 56.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
