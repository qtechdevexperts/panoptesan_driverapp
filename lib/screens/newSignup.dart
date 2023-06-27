import '../helpers/dialog/src/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../handlers/LoginSignupHandler.dart';
import '../helpers/Colors.dart';
import '../helpers/dialog/src/progress_dialog.dart';
import '../helpers/snackbar.dart';
import 'SetProfile.dart';

class NewSignupScreen extends StatefulWidget {
  const NewSignupScreen({super.key});

  @override
  State<NewSignupScreen> createState() => _NewSignupScreenState();
}

class _NewSignupScreenState extends State<NewSignupScreen> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  int groupValue = 0;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  var isvisble = true;
  var isvisblerepeat = true;

  // bool _obscureText = true;
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
        body: Column(
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
                          "Name",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: black),
                        ),
                        10.verticalSpace,
                        Container(
                          width: 1.sw,
                          child: TextFormField(
                            controller: this.nameController,
                            decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                "assets/Icon awesome-user-alt.png",
                                scale: 3.5,
                              ),
                              filled: true,
                              fillColor: white,
                              hintText: 'John Smith',
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       'Forgot Password?',
                        //       style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black),
                        //     ),
                        //   ],
                        // ),
                        20.verticalSpace,
                        GestureDetector(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            if (nameController.text.isEmpty) {
                              return SnackbarWidget()
                                  .showsnackbar("Name is empty", context);
                            }

                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              return SnackbarWidget().showsnackbar(
                                  "Email or password field empty", context);
                            }
                            if (!emailController.text.isEmail) {
                              return SnackbarWidget().showsnackbar(
                                  "Please enter a valid email", context);
                            }

                            RegExp passwordRegex = RegExp(
                                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$');
                            if (!passwordRegex
                                .hasMatch(this.passwordController.text)) {
                              return SnackbarWidget().showsnackbar(
                                  'Password must contain at least one letter, one number, and one special character',
                                  context);
                            }

                            if (passwordController.text !=
                                repeatPasswordController.text) {
                              return SnackbarWidget().showsnackbar(
                                  "Password does not match", context);
                            }
                            ProgressDialog progressDialog = ProgressDialog(
                                context,
                                message: const Text("Please Wait....."),
                                title: const Text("Loading"));
                            progressDialog.show();
                            try {
                              await LoginSignupHandler().signup(
                                  emailController.text,
                                  passwordController.text);
                              progressDialog.dismiss();
                              //    await Get.offAll(MainScreen());
                              this.nameController.clear();
                              this.passwordController.clear();
                              this.repeatPasswordController.clear();
                              this.emailController.clear();

                              SnackbarWidget()
                                  .showsnackbar("Signup Successful", context);

                              await Get.off(SetProfileScreen());
                            } catch (ex) {
                              SnackbarWidget()
                                  .showsnackbar(ex.toString(), context);
                              progressDialog.dismiss();
                            }

                            //  Get.to(() => SetProfileScreen());
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
                                "Signup",
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       'Or login with',
                        //       style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black),
                        //     ),
                        //   ],
                        // ),
                        // 20.verticalSpace,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //       height: 60.h,
                        //       width: 0.42.sw,
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(35),
                        //       ),
                        //       child: Center(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Image.asset(
                        //               "assets/search.png",
                        //               scale: 5,
                        //             ),
                        //             10.horizontalSpace,
                        //             Text(
                        //               "Google",
                        //               style: GoogleFonts.inter(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       height: 60.h,
                        //       width: 0.42.sw,
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(35),
                        //       ),
                        //       child: Center(
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Image.asset(
                        //               "assets/facebook (2).png",
                        //               scale: 5,
                        //             ),
                        //             10.horizontalSpace,
                        //             Text(
                        //               "Facebook",
                        //               style: GoogleFonts.inter(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        20.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Already have account? ",
                                style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  color: Color(0xff04366B),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
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
    );

    ;
  }
}
