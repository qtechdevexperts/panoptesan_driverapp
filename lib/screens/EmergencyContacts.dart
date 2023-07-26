import 'package:panoptesan_alpha/handlers/LoginSignupHandler.dart';

import '../helpers/alerts.dart';
import '../helpers/dialog/src/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/BottomController.dart';
import '../controllers/profilecontroller.dart';
import '../helpers/Colors.dart';
import '../helpers/snackbar.dart';
import 'home.dart';
import 'homemain.dart';

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
                controller: profilecontroller.emergencyname,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Type name of your emergency contact person...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("Relationship",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                controller: profilecontroller.emergencyrelationship,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Your relation with emergency contact person...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("Contact Number",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: profilecontroller.emergencycontactnumber,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Type emergency contact persons number....',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
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
          'Emergency Contact',
          style: appbarstyle,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: horizontal20Padding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                40.verticalSpace,

                Text("Name",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                TextFormField(
                  controller: profilecontroller.emergencyname,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Type name of your emergency contact person...',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
                20.verticalSpace,
                Text("Relationship",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                TextFormField(
                  controller: profilecontroller.emergencyrelationship,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Your relation with emergency contact person...',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
                20.verticalSpace,
                Text("Contact Number",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black)),
                10.verticalSpace,
                TextFormField(
                  controller: this.profilecontroller.emergencycontactnumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Type emergency contact persons number....',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),
                30.verticalSpace,
                ..._textFields,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         _addTextField();
                //       },
                //       child: Container(
                //         width: 150.w,
                //         height: 60.h,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(30),
                //           color: Color(0xff005D99),
                //         ),
                //         child: Center(
                //           child: Text(
                //             "Add More",
                //             style: GoogleFonts.inter(
                //                 fontSize: 18,
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.w700),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),

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
                //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
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
                //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
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
                //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     : Container(),
                30.verticalSpace,
                GestureDetector(
                  onTap: () async {
                    print("tapped");
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(new FocusNode());

                    if (profilecontroller.emergencyname.text.isEmpty) {
                      return Alert()
                          .showalert("Emergency Contact Name", context);
                    }
                    if (profilecontroller.emergencyrelationship.text.isEmpty) {
                      return Alert()
                          .showalert("Emergency Contact Relationship", context);
                    }
                    if (profilecontroller.emergencycontactnumber.text.isEmpty) {
                      return Alert()
                          .showalert("Emergency Contact Number", context);
                    }

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
                        await profilecontroller
                            .setimage(profilecontroller.file);
                      }

                      profilecontroller.update();
                      progressDialog.dismiss();

                      Alert().showalertwithmessage(
                          "Profile Created Successfully", context);
                      // SnackbarWidget().showsnackbar("Success", context);

                      Get.off(MainScreen());
                    } catch (e) {
                      //   SnackbarWidget().showsnackbar(e.toString(), context);

                      Alert().showalertwithmessage(e.toString(), context);
                      progressDialog.dismiss();
                    }
                  },
                  child: Container(
                    height: 60.h,
                    width: 0.9.sw,
                    decoration: BoxDecoration(
                      color: Color(0xFF007AB6),
                      borderRadius: BorderRadius.circular(30),
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
      ),
    );
  }
}
