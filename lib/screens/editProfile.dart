import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profilecontroller.dart';
import '../helpers/Colors.dart';
import '../helpers/dialog/src/progress_dialog.dart';
import '../helpers/snackbar.dart';
import '../widgets/CustomButton.dart';
import 'home.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ProfileController videoController = Get.put(ProfileController());

  File? file = null;
  cameraimage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      this.file = File(file!.path);
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
      this.file = File(file!.path);
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

  String dropdownValue = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      // appBar: AppBar(
      //   leadingWidth: 70,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: GestureDetector(
      //     onTap: () => Get.back(),
      //     child: Padding(
      //       padding: const EdgeInsets.only(left: 20, bottom: 10),
      //       child: Container(
      //         width: 55,
      //         height: 50,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(30), color: white),
      //         child: Padding(
      //           padding: const EdgeInsets.all(16),
      //           child: SvgPicture.asset(
      //             'assets/leading.svg',
      //             color: Color(0xff005D99),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      //   title: Text(
      //     'Edit Profile',
      //     style: appbarstyle,
      //   ),
      // ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: constraint.maxHeight / 2.5,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                          child: Image.asset(
                        'assets/b3.png',
                        fit: BoxFit.fill,
                        height: 200,
                        width: double.infinity,
                      )),
                      const Positioned(
                        top: 50,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: CircleIconButton(
                          backgroundColor: Colors.white,
                          icon: Icons.arrow_back,
                          iconColor: Colors.blue,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      this.videoController.profile!.userDetail!.profileImg ==
                              null
                          ? Positioned(
                              top: 130,
                              child: Stack(
                                children: [
                                  this.file != null
                                      ? Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(this.file!),
                                              fit: BoxFit.cover,
                                            ),
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ))
                                      : Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image:
                                                  AssetImage('assets/p5.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          )),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleIconButton(
                                        icon: FontAwesomeIcons.camera,
                                        backgroundColor: Colors.blue,
                                        iconColor: Colors.white,
                                        onPressed: () {
                                          showChoiceDialoglistimagemore(
                                              context);
                                        }),
                                  )
                                ],
                              ),
                            )
                          : Positioned(
                              top: 130,
                              child: Stack(
                                children: [
                                  Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(videoController
                                              .profile!
                                              .userDetail!
                                              .profileImg!),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      )),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleIconButton(
                                        icon: FontAwesomeIcons.camera,
                                        backgroundColor: Colors.blue,
                                        iconColor: Colors.white,
                                        onPressed: () {
                                          showChoiceDialoglistimagemore(
                                              context);
                                        }),
                                  )
                                ],
                              ),
                            )
                    ],
                  ),
                ),
                Padding(
                  padding: horizontal20Padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // 30.verticalSpace,
                      // this.file != null
                      //     ? GestureDetector(
                      //         onTap: () {
                      //           showChoiceDialoglistimagemore(context);
                      //         },
                      //         child: Align(
                      //           alignment: Alignment.center,
                      //           child: Container(
                      //             child: Stack(
                      //               alignment: Alignment.center,
                      //               children: [
                      //                 Container(
                      //                   height: 115,
                      //                   width: 115,
                      //                   decoration: BoxDecoration(
                      //                     shape: BoxShape.circle,
                      //                     image: DecorationImage(
                      //                       image: FileImage(this.file!),
                      //                       fit: BoxFit.cover,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Positioned(
                      //                   bottom: 0,
                      //                   right: 10,
                      //                   child: Container(
                      //                       height: 20,
                      //                       width: 20,
                      //                       decoration: BoxDecoration(
                      //                         color: bprimary,
                      //                         shape: BoxShape.circle,
                      //                       ),
                      //                       child: Center(
                      //                         child: FaIcon(
                      //                           FontAwesomeIcons.plus,
                      //                           color: white,
                      //                           size: 15,
                      //                         ),
                      //                       )),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     : GestureDetector(
                      //         onTap: () {
                      //           showChoiceDialoglistimagemore(context);
                      //         },
                      //         child: Align(
                      //           alignment: Alignment.center,
                      //           child: Container(
                      //             child: Stack(
                      //               alignment: Alignment.center,
                      //               children: [
                      //                 Container(
                      //                   height: 115,
                      //                   width: 115,
                      //                   decoration: BoxDecoration(
                      //                     shape: BoxShape.circle,
                      //                     image: DecorationImage(
                      //                       image: NetworkImage(videoController
                      //                           .profile!.profile_img
                      //                           .toString()),
                      //                       fit: BoxFit.cover,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Positioned(
                      //                   bottom: 0,
                      //                   right: 10,
                      //                   child: Container(
                      //                       height: 20,
                      //                       width: 20,
                      //                       decoration: BoxDecoration(
                      //                         color: bprimary,
                      //                         shape: BoxShape.circle,
                      //                       ),
                      //                       child: Center(
                      //                         child: FaIcon(
                      //                           FontAwesomeIcons.plus,
                      //                           color: white,
                      //                           size: 15,
                      //                         ),
                      //                       )),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      // 15.verticalSpace,
                      Text("Name",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: black)),
                      10.verticalSpace,
                      TextFormField(
                        controller: videoController.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: 'Type your full name...',
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
                      Text("About yourself",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: black)),
                      10.verticalSpace,
                      TextFormField(
                        controller: videoController.desc,
                        maxLines: 4,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: 'Write something about yourself...',
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
                      Text("Date of birth",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: black)),
                      10.verticalSpace,
               TextFormField(
                  onTap: () async {
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1940),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      videoController.month.text = date.month.toString();
                      videoController.day.text = date.day.toString();
                      videoController.year.text = date.year.toString();
                      videoController.dob.text =
                          videoController.month.text +
                              "-" +
                              videoController.day.text +
                              "-" +
                              videoController.year.text;
                    }
                  },
                  readOnly: true,
                  controller: videoController.dob,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    hintText: 'Please date of birth',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w300, color: grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                  ),
                ),               20.verticalSpace,
                      Text("Car Make",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: black)),
                      10.verticalSpace,
                   TextFormField(
                        controller: this.videoController.carmake,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: 'Please type your car make...',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                      ),        20.verticalSpace,
                      // Text("Gender",
                      //     style: GoogleFonts.inter(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400,
                      //         color: black)),
                      // 10.verticalSpace,
                      // DropdownButtonFormField<String>(
                      //   isDense: true,
                      //   icon: FaIcon(
                      //     Icons.keyboard_arrow_down_rounded,
                      //     color: grey,
                      //     size: 25,
                      //   ),
                      //   value: dropdownValue,
                      //   iconSize: 24,

                      //   elevation: 16,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: white,
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //         borderSide: BorderSide.none),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //         borderSide: BorderSide.none),
                      //     disabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //         borderSide: BorderSide.none),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //         borderSide: BorderSide.none),
                      //   ),

                      //   style: GoogleFonts.inter(
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w400,
                      //       color: black),

                      //   onChanged: (newValue) {
                      //     videoController.gender.text = newValue.toString();
                      //     setState(() {
                      //       dropdownValue = newValue!;
                      //     });
                      //   },

                      //   items: <String>[
                      //     'Male',
                      //     'Female',
                      //     'Other'
                      //   ] //drop down menu items list here

                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Text(
                      //             value)); //drop down menu items list here with keyboard arrow down with white filled color
                      //   }).toList(), //drop down menu items list here with keyboard arrow down with white filled color
                      // ),
                      20.verticalSpace,

                      Text("City, State",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: black)),
                      10.verticalSpace,
                      TextFormField(
                        controller: this.videoController.address,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: 'Please type your address...',
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

                      Text("What's your car's name",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: black)),
                      10.verticalSpace,
                      TextFormField(
                        controller: videoController.carname,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: 'Please type the name of your car',
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

                      Text("Model",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: black)),
                      10.verticalSpace,
                      TextFormField(
                        controller: videoController.model,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: 'Please type the model of your car...',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      10.verticalSpace,
                      Text("Driving Habits",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: black)),
                      10.verticalSpace,
                      TextFormField(
                        controller: videoController.drivinghabit,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          hintText: 'Please enter your driving habits ',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                      ),     20.verticalSpace,
                      CustomButton(
                        tap: () async {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(new FocusNode());
                          ProgressDialog progressDialog = ProgressDialog(
                              context,
                              message: const Text("Please Wait....."),
                              title: const Text("Loading"));

                          progressDialog.show();
                          videoController.dob.text =
                              videoController.month.text +
                                  "-" +
                                  videoController.day.text +
                                  "-" +
                                  videoController.year.text;
                          try {
                            await videoController.UpdateProfile(
                                videoController.name.text,
                                videoController.gender.text,
                                videoController.dob.text,
                                videoController.desc.text,
                                videoController.address.text);
                            if (this.file != null) {
                              await videoController.setimage(file);
                            }

                            progressDialog.dismiss();
                            SnackbarWidget().showsnackbar("Success", context);
                            videoController.update();
                          } catch (e) {
                            SnackbarWidget()
                                .showsnackbar(e.toString(), context);
                            progressDialog.dismiss();
                          }
                        },
                        ButtonText: "Save",
                        width: 1.sw,
                        textColor: white,
                        colors: kprimary,
                        height: 60.h,
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
