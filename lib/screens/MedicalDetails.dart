import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/CustomButton.dart';
import '../controllers/profilecontroller.dart';
import '../helpers/Colors.dart';
import '../helpers/alerts.dart';
import 'EmergencyContacts.dart';

//import 'EmergencyContacts.dart';

class MedicalDetailsScreen extends StatefulWidget {
  const MedicalDetailsScreen({super.key});

  @override
  State<MedicalDetailsScreen> createState() => _MedicalDetailsScreenState();
}

class _MedicalDetailsScreenState extends State<MedicalDetailsScreen> {
  String dropdownValue = 'Ford';
  String dropdownValue1 = 'Yes/No';
  var profilecontroller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            splashColor: Colors.white, // Customize the ripple effect color
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0A7FB8),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Medical Details',
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
                  Text("Medical Conditions",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: black)),
                  10.verticalSpace,
                  TextFormField(
                    controller: profilecontroller.medicalconditions,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      hintText: 'Type your medical conditions...',
                      hintStyle: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  20.verticalSpace,
                  // Text("Emergency Contact", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
                  // 10.verticalSpace,
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: white,
                  //     hintText: '+123456789',
                  //     hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  //   ),
                  // ),
                  // 20.verticalSpace,
                  Text("Medical Notes",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: black)),
                  10.verticalSpace,
                  TextFormField(
                    controller: profilecontroller.medicalnotes,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      hintText: 'Write something about medical history...',
                      hintStyle: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  20.verticalSpace,
                  Text("Allergies & Reaction",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: black)),
                  10.verticalSpace,
                  TextFormField(
                    controller: profilecontroller.allergies,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      hintText: 'Please type allergies & their reaction...',
                      hintStyle: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  20.verticalSpace,
                  Text("Medications",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: black)),
                  10.verticalSpace,
                  TextFormField(
                    controller: profilecontroller.medications,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      hintText: 'Please type the name medications you take...',
                      hintStyle: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  20.verticalSpace,
                  Text("Organ Donor",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: black)),
                  10.verticalSpace,
                  TextFormField(
                    controller: profilecontroller.organdonor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      hintText: 'Please type your carmake...',
                      hintStyle: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weight",
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: black),
                          ),
                          10.verticalSpace,
                          Container(
                            width: 0.44.sw,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: profilecontroller.weight,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: white,
                                hintText: '/lb',
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Height",
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: black),
                          ),
                          10.verticalSpace,
                          Container(
                            width: 0.44.sw,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: profilecontroller.height,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: white,
                                hintText: 'Foot-inch',
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  20.verticalSpace,
                  CustomButton(
                    // tap: () {
                    //   final bottomctrl = Get.put(BottomController());

                    //   if (bottomctrl.navigationBarIndexValue != 2) {
                    //     bottomctrl.navBarChange(2);
                    //   } else {
                    //     Get.back();
                    //   }
                    // },
                    // tap: () => Get.to(() => MainScreen()),
                    tap: () {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(new FocusNode());

                      if (profilecontroller.medicalconditions.text.isEmpty) {
                        return Alert().showalert("Medical Conditions", context);
                      }
    if (profilecontroller.medicalnotes.text.isEmpty) {
                        return Alert().showalert("Medical Notes", context);
                      }
                         if (profilecontroller.allergies.text.isEmpty) {
                        return Alert().showalert("Allergies & Reaction", context);
                      }

                        if (profilecontroller.allergies.text.isEmpty) {
                        return Alert().showalert("Medications", context);
                      }

                          if (profilecontroller.organdonor.text.isEmpty) {
                        return Alert().showalert("Organ Donor", context);
                      }

                          if (profilecontroller.weight.text.isEmpty) {
                        return Alert().showalert("Weight", context);
                      }
                         if (profilecontroller.weight.text.isEmpty) {
                        return Alert().showalert("height", context);
                      }
                      Get.to(() => EmergencyContactsScreen());
                    },

                    ButtonText: "Continue ",
                    width: 1.sw,
                    textColor: white,
                    colors: Color(0xFF007AB6),
                    height: 60.h,
                  ),
                  50.verticalSpace,
                ]),
          ),
        ),
      ),
    );
  }
}
