import '../helpers/dialog/src/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/handlers/LoginSignupHandler.dart';
import 'package:panoptesan_alpha/screens/newSignup.dart';
import 'package:panoptesan_alpha/screens/newforgotpassword.dart';

import '../helpers/Colors.dart';
import '../helpers/snackbar.dart';
import '../screens/SetProfile.dart';
import 'forgotpassword.dart';
import 'homemain.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({super.key});

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  int groupValue = 0;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  var isvisble = true;
  var isvisblerepeat = true;

  bool _obscureText = true;
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
        appBar: AppBar(
          leadingWidth: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.grey.withOpacity(0.75),
                      ],
                    )),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: SvgPicture.asset('assets/leading.svg',
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/Group 1.png',
                  scale: 3,
                ),
              ),
              50.verticalSpace,
              Expanded(
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.r),
                      topRight: Radius.circular(35.r),
                    ),
                    color: Color(0xffe8f2fe),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.r),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          25.verticalSpace,
                          Text(
                            "Email",
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                          10.verticalSpace,
                          Container(
                            width: 1.sw,
                            child: TextFormField(
                              controller: this.emailController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xff8b8b8b),
                                  size: 20,
                                ),
                                filled: true,
                                fillColor: white,
                                hintText: 'info@loremipsum.com',
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff8b8b8b)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          Text(
                            "Password",
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black),
                          ),
                          10.verticalSpace,
                          Container(
                            width: 1.sw,
                            child: TextFormField(
                              controller: this.passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color(0xff8b8b8b),
                                    size: 20,
                                  ),
                                ),
                                filled: true,
                                fillColor: white,
                                hintText: '............',
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff8b8b8b)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          GestureDetector(
                            onTap: () {
                              Get.to(() => NewForgotPassword());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: black),
                                ),
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          GestureDetector(
                            onTap: () async {
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                return SnackbarWidget().showsnackbar(
                                    "Email or password field empty", context);
                              }

                              ProgressDialog progressDialog = ProgressDialog(
                                  context,
                                  message: const Text("Please Wait....."),
                                  title: const Text("Loading"));
                              progressDialog.show();
                              try {
                                await LoginSignupHandler().login(
                                    emailController.text,
                                    passwordController.text);
                                progressDialog.dismiss();

                                await Get.offAll(MainScreen());
                              } catch (ex) {
                                SnackbarWidget()
                                    .showsnackbar(ex.toString(), context);
                                progressDialog.dismiss();
                              }
                            },
                            child: Container(
                              height: 60.h,
                              width: 0.9.sw,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff017cb7),
                                      Color(0xff36b5e0),
                                    ],
                                  )),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Or login with',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: black),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 60.h,
                                width: 0.42.sw,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/search.png",
                                        scale: 5,
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        "Google",
                                        style: GoogleFonts.inter(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 60.h,
                                width: 0.42.sw,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/facebook (2).png",
                                        scale: 5,
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        "Facebook",
                                        style: GoogleFonts.inter(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          GestureDetector(
                            onTap: () async {
                              Get.to(() => NewSignupScreen());
                            },
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    color: Color(0xff04366B),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Signup',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        color: Color(0xff037DB8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
