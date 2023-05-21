import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/controller/BottomController.dart';
import 'package:panoptesan_alpha/controller/profilecontroller.dart';
import 'package:panoptesan_alpha/helper/snackbar.dart';

import '../Helper/Colors.dart';

import '../mainFolder/homemain.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  var profilecontroller = Get.put(ProfileController());
  final List<Widget> _textFields = [];
  int _counter = 1;

  void _addTextField() {
    setState(() {
      _counter++;
      _textFields.add(
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'Contact Detail: $_counter.',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w400, color: black),
              ),
              20.verticalSpace,
              Text("Name",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Type name of your emergency contact person...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("Relationship",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Your relation with emergency contact person...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("Contact Number",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Type emergency contact persons number....',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      );
    });
  }

  bool addmore = false;
  final bt = Get.put(BottomController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
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
          'Emergency Contact',
          style: appbarstyle,
        ),
      ),
      body: Padding(
        padding: horizontal20Padding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              40.verticalSpace,

              Text("Name",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Type name of your emergency contact person...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("Relationship",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Your relation with emergency contact person...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("Contact Number",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Type emergency contact persons number....',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              30.verticalSpace,
              ..._textFields,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _addTextField();
                    },
                    child: Container(
                      width: 150.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff005D99),
                      ),
                      child: Center(
                        child: Text(
                          "Add More",
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              // addmore
              //     ? Container(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text("Name", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              //             10.verticalSpace,
              //             TextFormField(
              //               decoration: InputDecoration(
              //                 filled: true,
              //                 fillColor: white,
              //                 hintText: 'Type name of your emergency contact person...',
              //                 hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
              //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              //               ),
              //             ),
              //             20.verticalSpace,
              //             Text("Relationship", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              //             10.verticalSpace,
              //             TextFormField(
              //               decoration: InputDecoration(
              //                 filled: true,
              //                 fillColor: white,
              //                 hintText: 'Your relation with emergency contact person...',
              //                 hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
              //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              //               ),
              //             ),
              //             20.verticalSpace,
              //             Text("Contact Number", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              //             10.verticalSpace,
              //             TextFormField(
              //               decoration: InputDecoration(
              //                 filled: true,
              //                 fillColor: white,
              //                 hintText: 'Type emergency contact persons number....',
              //                 hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
              //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              //               ),
              //             ),
              //           ],
              //         ),
              //       )
              //     : Container(),
              30.verticalSpace,
              GestureDetector(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(new FocusNode());
                  ProgressDialog progressDialog = ProgressDialog(context,
                      message: const Text("Please Wait....."),
                      title: const Text("Loading"));

                  progressDialog.show();
                  profilecontroller.dob.text = profilecontroller.month.text +
                      "-" +
                      profilecontroller.day.text +
                      "-" +
                      profilecontroller.year.text;
                  try {
                    await profilecontroller.UpdateProfile(
                        profilecontroller.name.text,
                        profilecontroller.gender.text,
                        profilecontroller.dob.text,
                        profilecontroller.desc.text,
                        profilecontroller.address.text);
                    if (profilecontroller.file != null) {
                      await profilecontroller.setimage(profilecontroller.file);
                    }

                    progressDialog.dismiss();
                    SnackbarWidget().showsnackbar("Success", context);
                    profilecontroller.update();

                    Get.off(MainScreen());
                  } catch (e) {
                    SnackbarWidget().showsnackbar(e.toString(), context);
                    progressDialog.dismiss();
                  }
                },
                child: Container(
                  height: 60.h,
                  width: 0.9.sw,
                  decoration: BoxDecoration(
                    color: Color(0xff005D99),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
