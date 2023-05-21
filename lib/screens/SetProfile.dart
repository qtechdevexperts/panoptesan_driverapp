import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';

import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
import 'package:panoptesan_alpha/Widgets/textfield.dart';
import 'package:panoptesan_alpha/controller/profilecontroller.dart';
import 'package:panoptesan_alpha/mainFolder/homemain.dart';
import 'package:panoptesan_alpha/screens/MedicalDetails.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  String dropdownValue = 'Ford';
  String dropdownValue1 = 'Pleasure Cruiser';

  var profilecontroller = Get.put(ProfileController());
  cameraimage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      profilecontroller.file = File(file!.path);
    });
    // if (images.length < 10) {
    //   CroppedFile? croppedFile = await ImageCropper().cropImage(
    //     sourcePath: file!.path,
    //     aspectRatioPresets: [
    //       CropAspectRatioPreset.square,
    //       CropAspectRatioPreset.ratio4x3,
    //       CropAspectRatioPreset.original,
    //       CropAspectRatioPreset.ratio5x4,
    //       CropAspectRatioPreset.ratio16x9,
    //     ],

    //     compressQuality: 100,
    //     compressFormat: ImageCompressFormat.jpg,

    //     // aspectRatio: CropAspectRatio(

    //     //     ratioX: 900, ratioY: 1600),

    //     uiSettings: [
    //       IOSUiSettings(aspectRatioLockEnabled: true, title: 'CropImage'),
    //       AndroidUiSettings(
    //           toolbarTitle: 'CropImage',
    //           toolbarColor: Colors.white,
    //           toolbarWidgetColor: Colors.black,
    //           initAspectRatio: CropAspectRatioPreset.original,
    //           lockAspectRatio: true),
    //     ],
    //   );

    //   if (croppedFile != null) {
    //     var file1 = XFile(croppedFile.path);

    //     images.add(file1);
    //     imagepicked = true;

    //     notifyListeners();
    //   } else {}
    // }
    Navigator.pop(context);
  }

  galleryimage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profilecontroller.file = File(file!.path);
    });
    // if (images.length < 10) {
    //   CroppedFile? croppedFile = await ImageCropper().cropImage(
    //     sourcePath: file!.path,
    //     aspectRatioPresets: [
    //       CropAspectRatioPreset.square,
    //       CropAspectRatioPreset.ratio4x3,
    //       CropAspectRatioPreset.original,
    //       CropAspectRatioPreset.ratio5x4,
    //       CropAspectRatioPreset.ratio16x9,
    //     ],

    //     compressQuality: 100,
    //     compressFormat: ImageCompressFormat.jpg,

    //     // aspectRatio: CropAspectRatio(

    //     //     ratioX: 900, ratioY: 1600),

    //     uiSettings: [
    //       IOSUiSettings(aspectRatioLockEnabled: true, title: 'CropImage'),
    //       AndroidUiSettings(
    //           toolbarTitle: 'CropImage',
    //           toolbarColor: Colors.white,
    //           toolbarWidgetColor: Colors.black,
    //           initAspectRatio: CropAspectRatioPreset.original,
    //           lockAspectRatio: true),
    //     ],
    //   );

    //   if (croppedFile != null) {
    //     var file1 = XFile(croppedFile.path);

    //     images.add(file1);
    //     imagepicked = true;

    //     notifyListeners();
    //   } else {}
    // }

    Navigator.pop(context);
  }

  Future<void> showChoiceDialoglistimagemore(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              title: const Text(
                "Add photos from",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  // color: pinkish,
                ),
              ),
              content: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ListBody(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          galleryimage(context);
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )),
                            child: ListTile(
                              // leading:
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    CupertinoIcons.photo_on_rectangle,
                                    color: Colors.pink,
                                  ),
                                  Text(
                                    "   Gallery",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      // color: pinkish,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          cameraimage(context);
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )),
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    CupertinoIcons.camera,
                                    color: Colors.pink,
                                  ),
                                  Text(
                                    "   Camera",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      // color: pinkish,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

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
          'Set Profile',
          style: appbarstyle,
        ),
      ),
      body: Padding(
        padding: horizontal20Padding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              30.verticalSpace,
              profilecontroller.file == null
                  ? GestureDetector(
                      onTap: () {
                        showChoiceDialoglistimagemore(context);
                      },
                      child: Align(
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
                    )
                  : Align(
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
                                  image: FileImage(
                                      File(profilecontroller.file!.path)),
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
              Text("Name",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                controller: profilecontroller.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Type your full name...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("About yourself",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                controller: profilecontroller.desc,
                maxLines: 2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Write something about yourself...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("DOB",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: profilecontroller.month,
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 35),
                        filled: true,
                        fillColor: white,
                        hintText: 'Month',
                        hintStyle: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: TextFormField(
                      controller: profilecontroller.day,
                      maxLength: 2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 47),
                        filled: true,
                        fillColor: white,
                        hintText: 'Day',
                        hintStyle: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: TextFormField(
                      controller: profilecontroller.year,
                      maxLength: 4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 47),
                        filled: true,
                        fillColor: white,
                        hintText: 'Year',
                        hintStyle: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Text("Car Make",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
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
                value: dropdownValue,
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
                    dropdownValue = newValue!;
                  });
                },

                items: <String>[
                  'Ford',
                  'Honda',
                  'Toyota'
                ] //drop down menu items list here

                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                          value)); //drop down menu items list here with keyboard arrow down with white filled color
                }).toList(), //drop down menu items list here with keyboard arrow down with white filled color
              ),
              20.verticalSpace,
              Text("City, State",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Please type your address...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("What's your car's name",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Please type the name of your car...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("Model",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
              10.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  hintText: 'Please type the model of your car...',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              20.verticalSpace,
              Text("Driving Habits",
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w400, color: black)),
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
                },

                items: <String>[
                  'Pleasure Cruiser',
                  'Pleasure Cruiser1',
                  'Pleasure Cruiser2'
                ] //drop down menu items list here

                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                          value)); //drop down menu items list here with keyboard arrow down with white filled color
                }).toList(), //drop down menu items list here with keyboard arrow down with white filled color
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
                tap: () => Get.to(() => MedicalDetailsScreen()),
                ButtonText: "Continue ",
                width: 1.sw,
                textColor: white,
                colors: kprimary,
                height: 60.h,
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
