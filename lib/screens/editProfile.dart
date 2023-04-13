import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
import 'package:panoptesan_alpha/Widgets/textfield.dart';
import 'package:panoptesan_alpha/mainFolder/homemain.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String dropdownValue = 'Male';
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
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
          'Edit Profile',
          style: appbarstyle,
        ),
      ),
      body: Padding(
        padding: horizontal20Padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            30.verticalSpace,
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 115,
                      width: 115,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(userimages[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: bprimary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              color: white,
                              size: 15,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            15.verticalSpace,
            Text("Name", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
            10.verticalSpace,
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                hintText: 'Type your full name...',
                hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              ),
            ),
            20.verticalSpace,
            Text("About yourself", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
            10.verticalSpace,
            TextFormField(
              maxLines: 2,
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                hintText: 'Write something about yourself...',
                hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              ),
            ),
            20.verticalSpace,
            Text("DOB", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 35),
                      filled: true,
                      fillColor: white,
                      hintText: 'Month',
                      hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                20.horizontalSpace,
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 47),
                      filled: true,
                      fillColor: white,
                      hintText: 'Day',
                      hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                20.horizontalSpace,
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 47),
                      filled: true,
                      fillColor: white,
                      hintText: 'Year',
                      hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Text("Gender", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
            10.verticalSpace,
            DropdownButtonFormField<String>(
              isDense: true,
              icon: FaIcon(
                Icons.keyboard_arrow_down_rounded,
                color: grey,
                size: 25,
              ),
              value: dropdownValue,
              iconSize: 24,

              elevation: 16,
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              ),

              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black),

              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },

              items: <String>['Male', 'Female', 'Other'] //drop down menu items list here

                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value)); //drop down menu items list here with keyboard arrow down with white filled color
              }).toList(), //drop down menu items list here with keyboard arrow down with white filled color
            ),
            20.verticalSpace,
            Text("City, State", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: black)),
            10.verticalSpace,
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                hintText: 'Please type your address...',
                hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
              ),
            ),
            20.verticalSpace,
            CustomButton(
              tap: () => Get.to(() => MainScreen()),
              ButtonText: "Save",
              width: 1.sw,
              textColor: white,
              colors: kprimary,
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}
