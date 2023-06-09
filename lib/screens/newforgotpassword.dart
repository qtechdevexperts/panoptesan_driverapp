import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/controllers/profilecontroller.dart';
import 'package:panoptesan_alpha/handlers/LoginSignupHandler.dart';
import 'package:panoptesan_alpha/screens/newSignup.dart';
import 'package:panoptesan_alpha/screens/newpincodescreen.dart';

import '../helpers/Colors.dart';
import '../helpers/snackbar.dart';
import '../screens/SetProfile.dart';
import 'forgotpassword.dart';
import 'homemain.dart';

class NewForgotPassword extends StatefulWidget {
  NewForgotPassword({Key? key}) : super(key: key);

  @override
  State<NewForgotPassword> createState() => _NewForgotPasswordState();
}

class _NewForgotPasswordState extends State<NewForgotPassword> {
  int groupValue = 0;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  var isvisble = true;
  var isvisblerepeat = true;

  bool _obscureText = true;

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
                            GestureDetector(
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                if (emailController.text.isEmpty ||
                                    !emailController.text.isEmail) {
                                  return SnackbarWidget().showsnackbar(
                                      "Email field is empty or incorrect",
                                      context);
                                }
                                ProgressDialog progressDialog = ProgressDialog(
                                    context,
                                    message: const Text("Please Wait....."),
                                    title: const Text("Loading"));
                                progressDialog.show();
                                try {
                                  await LoginSignupHandler()
                                      .forgotpassword(emailController.text);
                                  progressDialog.dismiss();
                                  SnackbarWidget().showsnackbar(
                                      "Pincode has been sent to your email please check",
                                      context);
                                  Get.to(NewPinCodeScreen(
                                    email: emailController.text,
                                  ));
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
