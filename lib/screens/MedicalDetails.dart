import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/controller/profilecontroller.dart';
import 'package:panoptesan_alpha/screens/EmergencyContacts.dart';

import '../Helper/Colors.dart';
import '../Widgets/CustomButton.dart';
import '../mainFolder/homemain.dart';
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
          'Medical Details',
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
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
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
                //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
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
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
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
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
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
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
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
                DropdownButtonFormField<String>(
                  hint: Text("Please select...",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: black)),
                  isDense: true,
                  icon: FaIcon(
                    Icons.keyboard_arrow_down_rounded,
                    color: grey,
                    size: 25,
                  ),
                  value: dropdownValue1,
                  iconSize: 24,

                  elevation: 16,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                  ),

                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black),

                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                    });

                    profilecontroller.organdonor.text = newValue.toString();
                  },

                  items: <String>[
                    'Yes/No',
                    'Yes',
                    'No'
                  ] //drop down menu items list here

                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                            value)); //drop down menu items list here with keyboard arrow down with white filled color
                  }).toList(), //drop down menu items list here with keyboard arrow down with white filled color
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
                                  borderRadius: BorderRadius.circular(5),
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
                                  borderRadius: BorderRadius.circular(5),
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
                  tap: () => Get.to(() => EmergencyContactsScreen()),

                  ButtonText: "Continue ",
                  width: 1.sw,
                  textColor: white,
                  colors: kprimary,
                  height: 60.h,
                ),
                50.verticalSpace,
              ]),
        ),
      ),
    );
  }
}
