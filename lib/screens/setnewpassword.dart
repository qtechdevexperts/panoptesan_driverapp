import '../helpers/dialog/src/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/controllers/profilecontroller.dart';
import 'package:panoptesan_alpha/handlers/LoginSignupHandler.dart';
import 'package:panoptesan_alpha/screens/NewLoginScreen.dart';
import 'package:panoptesan_alpha/screens/newSignup.dart';
import 'package:panoptesan_alpha/screens/newpincodescreen.dart';

import '../helpers/Colors.dart';
import '../helpers/snackbar.dart';
import '../screens/SetProfile.dart';
import 'forgotpassword.dart';
import 'homemain.dart';

class SetNewPassword extends StatefulWidget {
  String pincode;
  String email;

  SetNewPassword({required this.pincode, required this.email});
  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  int groupValue = 0;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  var isvisble = true;
  var isvisblerepeat = true;

  bool _obscureText = true;
  var _obscureText2 = true;

  var profilecontroller = Get.put(ProfileController());
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
        body: LayoutBuilder(builder: (context, constraints) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/Group 1.png',
                    scale: 4,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                ),
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
                            Text(
                              "Confirm NewPassword",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                            10.verticalSpace,
                            Container(
                              width: 1.sw,
                              child: TextFormField(
                                controller: this.repeatPasswordController,
                                obscureText: _obscureText2,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText2 = !_obscureText2;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText2
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
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                if (passwordController.text !=
                                        repeatPasswordController.text ||
                                    passwordController.text.isEmpty ||
                                    repeatPasswordController.text.isEmpty) {
                                  return SnackbarWidget().showsnackbar(
                                      "Password does not match", context);
                                }
                                RegExp passwordRegex = RegExp(
                                    r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$');
                                if (!passwordRegex
                                    .hasMatch(this.passwordController.text)) {
                                  return SnackbarWidget().showsnackbar(
                                      'Password must contain at least one letter, one number, and one special character',
                                      context);
                                }

                                ProgressDialog progressDialog = ProgressDialog(
                                    context,
                                    message: const Text("Please Wait....."),
                                    title: const Text("Loading"));
                                progressDialog.show();
                                try {
                                  await LoginSignupHandler().setpassword(
                                      widget.email,
                                      passwordController.text,
                                      widget.pincode);
                                  progressDialog.dismiss();
                                  SnackbarWidget().showsnackbar(
                                      "Password Set Successfully", context);

                                      repeatPasswordController.clear();
                                      passwordController.clear();
                                  await Get.offAll(NewLoginScreen());
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
                                    "Continue",
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
