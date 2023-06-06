import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/screens/NewLoginScreen.dart';

import 'package:slide_to_confirm/slide_to_confirm.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.sh,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/Mask Group 1.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 64.h),
              Container(
                height: 290,
                width: 290,
                child: Center(
                    child: Image.asset(
                  'assets/Group 1.png',
                  scale: 3.5,
                )),
              ),
              Spacer(),
              Text(
                "Drive and Record - Unlock the Possibilities of Your Car with Our App",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              30.verticalSpace,
              Center(
                child: Container(
                  width: 0.7.sw,
                  height: 90.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 5.w,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(45.r)),
                  child: ConfirmationSlider(
                    sliderButtonContent: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 35,
                        color: Color(0xff3CBBE5),
                      ),
                    ),

                    // foregroundColor: Colors.white,
                    iconColor: Colors.black,
                    text: "Get Started",
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    backgroundColor: Color(0xff3CBBE5),
                    onConfirmation: () => {Get.to(NewLoginScreen())},
                  ),
                ),
              ),
              30.verticalSpace,
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
