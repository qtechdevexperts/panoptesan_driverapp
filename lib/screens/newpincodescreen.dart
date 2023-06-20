import '../helpers/dialog/src/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/handlers/LoginSignupHandler.dart';
import 'package:panoptesan_alpha/screens/newSignup.dart';
import 'package:panoptesan_alpha/screens/setnewpassword.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../helpers/Colors.dart';
import '../helpers/snackbar.dart';
import '../screens/SetProfile.dart';
import 'forgotpassword.dart';
import 'homemain.dart';

class NewPinCodeScreen extends StatefulWidget {
  String email;

  NewPinCodeScreen({required this.email});
  @override
  State<NewPinCodeScreen> createState() => _NewPinCodeScreenState();
}

class _NewPinCodeScreenState extends State<NewPinCodeScreen> {
  TextEditingController pincode = new TextEditingController();
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
                      color: Color(0xffE8F1FE),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.r),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            25.verticalSpace,
                            Text(
                              "One Time Password",
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                            10.verticalSpace,
                            PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              hintStyle: TextStyle(color: Colors.white),
                              textStyle: TextStyle(color: Colors.black),
                              length: 6,
                              obscureText: false,
                              obscuringCharacter: '*',
//
                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              validator: (v) {
                                // if (v!.length < 6) {
                                //   return "Enter Full Code";
                                // } else {
                                //   return null;
                                // }
                              },
                              pinTheme: PinTheme(
                                fieldOuterPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                selectedFillColor: Colors.white,
                                selectedColor: Colors.white,
                                disabledColor: Colors.white,
                                inactiveColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                activeColor: Colors.white,
                                shape: PinCodeFieldShape.circle,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: constraints.maxHeight * 0.1,
                                fieldWidth: constraints.maxWidth * 0.1,
                                activeFillColor: Colors.transparent,
                              ),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
// errorAnimationController: errorController,
                              controller: pincode,
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
                                // setState(() {
                                //   currentText = value;
                                // });
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");
//if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            ),
                            20.verticalSpace,
                            GestureDetector(
                              onTap: () async {
                                if (pincode.text.length < 6) {
                                  return SnackbarWidget().showsnackbar(
                                      "Invalid Pincode, Please enter correct Pincode",
                                      context);
                                }
                                ProgressDialog progressDialog = ProgressDialog(
                                    context,
                                    message: const Text("Please Wait....."),
                                    title: const Text("Loading"));
                                progressDialog.show();
                                try {
                                  await LoginSignupHandler().verifypincode(
                                      widget.email, pincode.text);
                                  progressDialog.dismiss();

                                  Get.to(SetNewPassword(
                                    pincode: pincode.text,
                                    email: widget.email,
                                  ));
                                } catch (ex) {
                                  progressDialog.dismiss();
                                  SnackbarWidget()
                                      .showsnackbar(ex.toString(), context);
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
