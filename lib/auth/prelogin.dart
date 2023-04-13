import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/Helper/golbal.dart';
import 'package:panoptesan_alpha/auth/LoginSignup.dart';

class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({super.key});

  @override
  State<PreLoginScreen> createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/authbackground.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: horizontal40Padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              230.verticalSpace,
              Text('Pre Login', style: semibold32white_inter),
              15.verticalSpace,
              GestureDetector(
                onTap: () {
                  setState(() {
                    signUp = true;
                  });
                  Get.to(() => LoginScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login below or',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'create an account',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: white,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    30.verticalSpace,
                  ],
                ),
              ),
              30.verticalSpace,
              GestureDetector(
                onTap: () {
                  setState(() {
                    signUp = false;
                  });
                  Get.to(() => LoginScreen());
                },
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      100.horizontalSpace,
                      Text(
                        'Login with',
                        style: GoogleFonts.inter(
                          fontSize: 19,
                          color: kprimary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        'Email',
                        style: GoogleFonts.inter(
                          fontSize: 19,
                          color: kprimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              15.verticalSpace,
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    65.horizontalSpace,
                    SvgPicture.asset('assets/fb.svg'),
                    15.horizontalSpace,
                    Text(
                      'Login with',
                      style: GoogleFonts.inter(
                        fontSize: 19,
                        color: kprimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      'Facebook',
                      style: GoogleFonts.inter(
                        fontSize: 19,
                        color: kprimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    65.horizontalSpace,
                    SvgPicture.asset('assets/g.svg'),
                    15.horizontalSpace,
                    Text(
                      'Login with',
                      style: GoogleFonts.inter(
                        fontSize: 19,
                        color: kprimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      'Google',
                      style: GoogleFonts.inter(
                        fontSize: 19,
                        color: kprimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    65.horizontalSpace,
                    SvgPicture.asset('assets/a.svg'),
                    15.horizontalSpace,
                    Text(
                      'Login with',
                      style: GoogleFonts.inter(
                        fontSize: 19,
                        color: kprimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      'Apple',
                      style: GoogleFonts.inter(
                        fontSize: 19,
                        color: kprimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
