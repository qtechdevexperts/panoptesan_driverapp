import 'package:ars_dialog/ars_dialog.dart';
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
import 'package:panoptesan_alpha/Widgets/AuthTextField.dart';
import 'package:getwidget/getwidget.dart';
import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
import 'package:panoptesan_alpha/auth/forgotpassword.dart';
import 'package:panoptesan_alpha/auth/prelogin.dart';
import 'package:panoptesan_alpha/mainFolder/homemain.dart';
import 'package:panoptesan_alpha/screens/SetProfile.dart';
import 'package:panoptesan_alpha/screens/home.dart';
import 'package:panoptesan_alpha/auth/LoginSignupHandler.dart';

import '../helper/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int groupValue = 0;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  var isvisble = true;
  var isvisblerepeat = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
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
              onTap: () => {Get.offAll(PreLoginScreen())},
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
          body: SingleChildScrollView(
            child: Padding(
              padding: horizontal20Padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  66.verticalSpace,
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          this.nameController.clear();
                          this.passwordController.clear();
                          this.repeatPasswordController.clear();
                          this.emailController.clear();
                          setState(() {
                            signUp = false;
                          });
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Sign in',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: signUp == false
                                      ? FontWeight.w600
                                      : FontWeight.w300,
                                ),
                              ),
                              10.verticalSpace,
                              signUp == false
                                  ? Container(
                                      width: 40.w,
                                      height: 1,
                                      color: kprimary,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      30.horizontalSpace,
                      GestureDetector(
                        onTap: () {
                          this.emailController.clear();
                          this.passwordController.clear();
                          setState(() {
                            signUp = true;
                          });
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Sign up',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: signUp == true
                                      ? FontWeight.w600
                                      : FontWeight.w300,
                                ),
                              ),
                              10.verticalSpace,
                              signUp == true
                                  ? Container(
                                      width: 40.w,
                                      height: 1,
                                      color: kprimary,
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  60.verticalSpace,
                  Text(signUp == true ? 'Signup' : 'Login',
                      style: semibold32white_inter),
                  20.verticalSpace,
                  signUp == true
                      ? Container(
                          width: 1.sw,
                          height: 55,
                          child: TextFormField(
                            controller: nameController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Name',
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
                        )
                      : Container(
                          width: 1.sw,
                          height: 55,
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Email',
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
                  signUp == true
                      ? Container(
                          width: 1.sw,
                          height: 55,
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Email',
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
                        )
                      : Container(),
                  signUp == true ? 15.verticalSpace : Container(),
                  Container(
                    width: 1.sw,
                    height: 55,
                    child: TextFormField(
                      obscureText: this.isvisble,
                      controller: passwordController,
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              this.isvisble = !isvisble;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              'assets/eye.svg',
                              color: white,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Password',
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
                  signUp == true ? 15.verticalSpace : Container(),
                  signUp == true
                      ? Container(
                          width: 1.sw,
                          height: 55,
                          child: TextFormField(
                            obscureText: isvisblerepeat,
                            controller: repeatPasswordController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    this.isvisblerepeat = !isvisblerepeat;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                    'assets/eye.svg',
                                    color: white,
                                  ),
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
                        )
                      : Container(),
                  15.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GFRadio(
                          toggleable: true,
                          size: 20,
                          value: groupValue,
                          groupValue: groupValue,
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              groupValue = value;
                            });
                          },
                          inactiveIcon: null,
                          activeBorderColor: Color(0xff005D99),
                          radioColor: kprimary,
                        ),
                        10.horizontalSpace,
                        Text(
                          signUp == true ? 'I agree to the ' : 'Remember Me',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        signUp == true
                            ? Text(
                                'terms of service ',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : Container(),
                        signUp == true
                            ? Text(
                                '& ',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            : Container(),
                        signUp == true
                            ? Text(
                                'privacy',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : Container(),
                        signUp == false ? 80.horizontalSpace : Container(),
                        signUp == false
                            ? GestureDetector(
                                onTap: () => Get.to(() => ForgotPassScreen()),
                                child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  signUp == true
                      ? CustomButton(
                          textColor: kprimary,
                          tap: () async {
                            FocusScope.of(context).unfocus();
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              return SnackbarWidget().showsnackbar(
                                  "Email or password field empty", context);
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

                              setState(() {
                                signUp = false;
                              });
                            } catch (ex) {
                              SnackbarWidget()
                                  .showsnackbar(ex.toString(), context);
                              progressDialog.dismiss();
                            }
                          },
                          // tap: () => LoginSignupHandler.register(
                          //     nameController.text,
                          //     emailController.text,
                          //     passwordController.text,
                          //     repeatPasswordController.text,
                          //     () => Get.to(() => SetProfileScreen())),

                          ButtonText: "Signup",
                          width: 0.9.sw,
                          colors: white,
                          height: 60.h,
                        )
                      : CustomButton(
                          textColor: kprimary,
                          //   tap: () => LoginSignupHandler.login(emailController.text, passwordController.text, () => Get.to(() => MainScreen()) ),

                          tap: () async {
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
                          ButtonText: "Login",
                          width: 0.9.sw,
                          colors: white,
                          height: 60.h,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
