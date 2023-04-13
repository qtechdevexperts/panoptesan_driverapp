import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/Widgets/AuthTextField.dart';
import 'package:getwidget/getwidget.dart';
import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
import 'package:panoptesan_alpha/auth/LoginSignup.dart';
import 'package:panoptesan_alpha/auth/otp.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool signUp = false;
  int groupValue = 0;
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xff005D99)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset('assets/leading.svg'),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: horizontal20Padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              100.verticalSpace,
              Text(
                'Create New Pasword',
                style: GoogleFonts.inter(fontSize: 32, color: white, fontWeight: FontWeight.w600),
              ),
              30.verticalSpace,
              Container(
                width: 1.sw,
                height: 55,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'assets/eye.svg',
                        color: white,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Enter New Password',
                    hintStyle: textfieldStyle,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: bprimary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: bprimary,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: bprimary,
                      ),
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              Container(
                width: 1.sw,
                height: 55,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'assets/eye.svg',
                        color: white,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Repeat Password',
                    hintStyle: textfieldStyle,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: bprimary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: bprimary,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: bprimary,
                      ),
                    ),
                  ),
                ),
              ),
              15.verticalSpace,
              CustomButton(
                textColor: kprimary,
                tap: () => Get.to(() => LoginScreen()),
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
