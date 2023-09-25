import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/controllers/BottomController.dart';
import 'package:panoptesan_alpha/controllers/profilecontroller.dart';
import 'package:panoptesan_alpha/helpers/Colors.dart';
import 'package:panoptesan_alpha/screens/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Widgets/CustomButton.dart';
import '../controllers/supportcontroller.dart';
import '../helpers/dialog/src/progress_dialog.dart';
import '../helpers/snackbar.dart';
import 'homemain.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  TextEditingController pincode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  "You have been invited, please enter code here to verify",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.045),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PinCodeTextField(
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
                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: 0),
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.white,
                  disabledColor: Colors.white,
                  inactiveColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: constraints.maxHeight * 0.1,
                  fieldWidth: constraints.maxWidth * 0.12,
                  activeFillColor: Colors.transparent,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
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
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                // tap: () {
                //   final bottomctrl = Get.put(BottomController());

                //   if (bottomctrl.navigationBarIndexValue != 2) {
                //     bottomctrl.navBarChange(2);
                //   } else {
                //     Get.back();
                //   }
                // },
                tap: () async {
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(new FocusNode());
                  if (pincode.text.isEmpty) {
                    return SnackbarWidget()
                        .showsnackbar("Please enter code", context);
                  }
                  ProgressDialog progressDialog = ProgressDialog(context,
                      message: const Text("Please Wait....."),
                      title: const Text("Loading"));
                  progressDialog.show();
                  try {
                   await SupportController().verifycode(this.pincode.text);

                    var profilecontroller = Get.put(ProfileController());
                   profilecontroller.profile= await profilecontroller.getprofile();
                    var controller = Get.put(BottomController());
                 
                    controller.navBarChange(4);
                    progressDialog.dismiss();
                    await showDialog(
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
                              30.verticalSpace,

                              Text(
                                "Success!",
                                style: GoogleFonts.inter(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: black),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Your invited code has been verified",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                              ),
                              SizedBox(height: 30.h),

                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                     Get.back();
                                      },
                                      child: Container(
                                          width: 1.sw,
                                          height: 51.h,
                                          decoration: BoxDecoration(
                                            color: bprimary,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Close',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: white,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
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
                Get.back(result: true);
               
                  } catch (ex) {
                    progressDialog.dismiss();
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
                              30.verticalSpace,

                              Text(
                                "Alert!",
                                style: GoogleFonts.inter(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: black),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Invalid code or no invite exist",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                              ),
                              SizedBox(height: 30.h),

                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Container(
                                          width: 1.sw,
                                          height: 51.h,
                                          decoration: BoxDecoration(
                                            color: bprimary,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Close',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: white,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
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
                  }

                  //   Get.to(() => MedicalDetailsScreen());
                },
                ButtonText: "Continue ",
                width: 1.sw,
                textColor: white,
                colors: Color(0xFF007AB6),
                height: 60.h,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xffF1F2F6),
        appBar: AppBar(
          leadingWidth: 70,
          leading: Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleIconButton(
              backgroundColor: Color(0xFF007AB6),
              icon: Icons.arrow_back,
              iconColor: Colors.white,
              onPressed: () {
                Get.back();
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            "Invite",
            style: appbarstyle,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    });
  }
}
