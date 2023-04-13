import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
import 'package:panoptesan_alpha/Widgets/textfield.dart';
import 'package:panoptesan_alpha/screens/SelectPaymentMethod.dart';

import '../Widgets/AuthTextField.dart';
import '../Widgets/Button.dart';

class AddCardScreen extends StatefulWidget {
  AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
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
          'Add Card',
          style: appbarstyle,
        ),
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
                'Select Card',
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                  color: black,
                ),
              ),
              20.verticalSpace,
              Container(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    visaRow(
                      "assets/visa.png",
                    ),
                    visaRow(
                      "assets/paypal.png",
                    ),
                    visaRow(
                      "assets/applepay.png",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              15.verticalSpace,
              Row(
                children: [
                  Text(
                    "Card Holder",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              CustomTextField(
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                fillcolor: white,
                hintText: 'Name on card...',
                underlineColor: white,
                hintColor: grey,
                widthh: 0.9.sw,
              ),
              15.verticalSpace,
              Row(
                children: [
                  Text(
                    "Card Number",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              CustomTextField(
                fillcolor: white,
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                underlineColor: white,
                hintColor: white,
                widthh: 0.9.sw,
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              15.verticalSpace,
              Row(
                children: [],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exp Date",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      6.verticalSpace,
                      CustomTextField(
                        fillcolor: white,
                        hintstyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          color: grey,
                          fontSize: 12,
                        ),
                        hintText: 'XX / XX',
                        underlineColor: white,
                        hintColor: white,
                        widthh: 0.43.sw,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CVV",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      6.verticalSpace,
                      CustomTextField(
                        fillcolor: white,
                        hintstyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          color: grey,
                          fontSize: 12,
                        ),
                        hintText: 'XXXX',
                        underlineColor: white,
                        hintColor: white,
                        widthh: 0.43.sw,
                      ),
                    ],
                  ),
                ],
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    tap: () => Get.to(() => CardScreen()),
                    ButtonText: "Add Now",
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
      height: 110.h,
      width: 118.w,
      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(4.5)),
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
