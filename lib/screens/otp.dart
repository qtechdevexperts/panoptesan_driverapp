import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../Widgets/CustomButton.dart';
import '../helpers/Colors.dart';
import 'CreateNewPassword.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  bool signUp = false;
  int groupValue = 0;
  TextEditingController textEditingController = TextEditingController();

  bool hasError = false;
  String currentText = "";
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
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff005D99)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset('assets/leading.svg'),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: horizontal40Padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              100.verticalSpace,
              Text('One Time Password',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                      fontSize: 30, color: white, fontWeight: FontWeight.w600)),
              10.verticalSpace,
              Text(
                'Check your email for OTP',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  letterSpacing: -0.06,
                  color: white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              30.verticalSpace,
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                hintStyle: TextStyle(color: Colors.white),
                textStyle: TextStyle(color: Colors.white),
                length: 4,
                obscureText: true,
                obscuringCharacter: '*',
//
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 6) {
                    return "Enter Full Code";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: 0),
                  selectedFillColor: Colors.transparent,
                  selectedColor: Colors.blue,
                  disabledColor: Colors.blue,
                  inactiveColor: Colors.blue,
                  inactiveFillColor: Colors.transparent,
                  activeColor: Colors.blue,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 58,
                  fieldWidth: 63,
                  activeFillColor: Colors.transparent,
                ),
                cursorColor: Colors.blue,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
// errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
// boxShadows: const [
// BoxShadow(
// offset: Offset(0, 1),
// color: Colors.black12,
// blurRadius: 10,
// )
// ],
                onCompleted: (v) {
                  debugPrint("Completed");
                },
// onTap: () {
// print("Pressed");
// },
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
//if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              15.verticalSpace,
              CustomButton(
                textColor: kprimary,
                tap: () => Get.to(() => CreateNewPasswordScreen()),
                ButtonText: "Continue",
                width: 0.9.sw,
                colors: white,
                height: 60.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
