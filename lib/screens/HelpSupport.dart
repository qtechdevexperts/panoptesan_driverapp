import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/dialog/src/progress_dialog.dart';
import 'package:panoptesan_alpha/helpers/snackbar.dart';
import '../Widgets/CustomButton.dart';
import '../controllers/supportcontroller.dart';
import '../helpers/Colors.dart';
import '../widgets/textfield.dart';
import 'Settings.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  var switchnot = false;
  var supportcontroller = Get.put(SupportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Container(
              width: 55,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: white),
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
          "Help & Support",
          style: appbarstyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                "assets/help-desk.png",
                width: 100,
                height: 100,
              )),
              20.verticalSpace,
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      'We are here to help so please get in touch with us.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
              ),
              // 20.verticalSpace,
              // Text(
              //   'Call Now (+1) 123456789',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w700,
              //     color: kprimary,
              //   ),
              // ),
              // 20.verticalSpace,
              // Text(
              //   'Lorem ipsum dolor sit amet consectetur adipiscing, elit congue nisi rutrum platea lacinia sapien, sed vel cras torquent scelerisque. Tempus pharetra quam congue natoque aptent sollicitudin et bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id.',
              //   textAlign: TextAlign.left,
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w400,
              //     color: grey,
              //   ),
              // ),
              // 30.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              6.verticalSpace,
              CustomTextField(
                controller: supportcontroller.name,
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                fillcolor: white,
                prefix: Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
                hintText: 'Type your full name...',
                underlineColor: white,
                hintColor: grey,
                widthh: 0.9.sw,
              ),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              6.verticalSpace,
              CustomTextField(
                controller: supportcontroller.email,
                prefix: Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                ),
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                fillcolor: white,
                hintText: 'Type your email...',
                underlineColor: white,
                hintColor: grey,
                widthh: 0.9.sw,
              ),
              12.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              6.verticalSpace,

              CustomTextField(
                keyboardtype: TextInputType.phone,
                controller: supportcontroller.phonenumber,
                prefix: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                fillcolor: white,
                hintText: '1 2 3 4 5 6...',
                underlineColor: white,
                hintColor: grey,
                widthh: 0.9.sw,
              ),
              12.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Request Type",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              // 6.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownButtonFormField<String>(
                  icon: FaIcon(
                    Icons.keyboard_arrow_down_rounded,
                    color: grey,
                    size: 20,
                  ),

                  //isExpanded: true,
                  value: null,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      if (newValue == "Request to become fleet manager") {
                        supportcontroller.category.text = "BECOME_FLEET";
                      }
                      if (newValue == "Other") {
                        supportcontroller.category.text = "OTHERS";
                      }
                    }
               
                  },
                  items: ["Request to become fleet manager", "Other"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 30, right: 20),
                    filled: true,
                    fillColor: white,
                    hintText: 'Please select one option',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              //  20.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              6.verticalSpace,
              CustomTextField(
                controller: supportcontroller.message,
                maxline: 4,
                hintstyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  color: grey,
                  fontSize: 12,
                ),
                fillcolor: white,
                hintText: 'Type your message...',
                underlineColor: white,
                hintColor: grey,
                widthh: 0.9.sw,
              ),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  tap: () async {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(new FocusNode());
                    ProgressDialog progressDialog = ProgressDialog(context,
                        message: const Text("Please Wait....."),
                        title: const Text("Loading"));

                    if (supportcontroller.email.text.isEmpty ||
                        supportcontroller.name.text.isEmpty ||
                        supportcontroller.message.text.isEmpty ||
                        supportcontroller.phonenumber.text.isEmail ||
                        supportcontroller.category.text.isEmpty) {
                      return SnackbarWidget()
                          .showsnackbar("Please fill all fields", context);
                    }

                    if (!supportcontroller.email.text.isEmail) {
                      return SnackbarWidget().showsnackbar(
                          "Invalid Email, Please enter correct email", context);
                    }
                    progressDialog.show();

                    try {
                      await supportcontroller.sendsupport();
                      progressDialog.dismiss();
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            insetPadding: horizontal20Padding,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 0.h),
                            actionsPadding: EdgeInsets.zero,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                40.verticalSpace,
                                // Container(
                                //   child: SvgPicture.asset(
                                //     "assets/checkCircle.svg",
                                //     color: bprimary,
                                //   ),
                                // ),
                                FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: Color(0xff44B241),
                                  size: 100,
                                ),
                                10.verticalSpace,
                                Text(
                                  "Request Submitted",
                                  style: GoogleFonts.inter(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: black),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "your message has been\n submitted successfully",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: grey),
                                ),
                                SizedBox(height: 30.h),

                                GestureDetector(
                                  onTap: () async {
                                    Get.back();
                                  },
                                  child: Container(
                                      width: 1.sw,
                                      height: 51.h,
                                      decoration: BoxDecoration(
                                        color: kprimary,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Go Back',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: white,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          );
                        },
                      ).then((value) => Get.back());
                    } catch (e) {
                      progressDialog.dismiss();
                    }
                  },
                  ButtonText: "Submit",
                  width: 1.sw,
                  textColor: white,
                  colors: kprimary,
                  height: 56.h,
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
