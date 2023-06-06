import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Button.dart';
import '../Widgets/CustomButton.dart';
import '../helpers/Colors.dart';
import 'AddCard.dart';
import 'homemain.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Container(
              width: 55,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: white),
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
          'Select Payment\n         Method',
          style: appbarstyle,
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => AddCardScreen()),
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
                    'assets/circlePlus.svg',
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
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              70.verticalSpace,
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: black,
                ),
              ),
              SizedBox(height: 30.h),
              // Container(
              //   width: Get.width,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       visaRow(
              //         "assets/Icon metro-visa@2x.png",
              //       ),
              //       visaRow(
              //         "assets/Icon awesome-paypal.png",
              //       ),
              //       visaRow(
              //         "assets/Icon awesome-apple-pay@2x.png",
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 20.h),
              Container(
                height: 270.h,
                width: 398.w,
                decoration: BoxDecoration(
                  color: kprimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      width: 320.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: white,
                            radius: 25.r,
                          ),
                          Transform.rotate(
                            angle: 90 * math.pi / 180,
                            child: Icon(
                              FontAwesomeIcons.wifi,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Container(
                      width: 320.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '**** 3090',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: white,
                            ),
                          ),
                          Text(
                            'EXP 09/24',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Container(
                      width: 320.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pomaline Moses . 0',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'VISA',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                width: 398.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: black,
                      ),
                    ),
                    Text(
                      '\$50',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 398.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w200,
                        color: black,
                      ),
                    ),
                    Text(
                      '\$2.5',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: 398.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: kprimary,
                      ),
                    ),
                    Text(
                      '\$55.50',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: kprimary,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    tap: () {
                      showDialog(
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
                                40.verticalSpace,
                                Container(
                                  child: SvgPicture.asset(
                                    "assets/checkCircle.svg",
                                    color: bprimary,
                                  ),
                                ),
                                36.verticalSpace,
                                Text(
                                  "Congratulations",
                                  style: GoogleFonts.inter(
                                      fontSize: 33,
                                      fontWeight: FontWeight.w700,
                                      color: kprimary),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "Payment done successfully",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: grey),
                                ),
                                SizedBox(height: 30.h),

                                GestureDetector(
                                  onTap: () => Get.to(() => MainScreen()),
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
                    ButtonText: "Confirm",
                    width: 0.9.sw,
                    textColor: white,
                    colors: kprimary,
                    height: 50.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container visaRow(img) {
    return Container(
      height: 114.h,
      width: 124.w,
      decoration: BoxDecoration(
        color: bprimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Container(
          width: 60,
          height: 61,
          child: Center(
            child: Image.asset(
              img,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
