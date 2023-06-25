// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:panoptesan_alpha/Helper/Colors.dart';
// import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
// import 'package:panoptesan_alpha/screens/editProfile.dart';
// import 'package:panoptesan_alpha/screens/subscriotion.dart';
// import 'package:panoptesan_alpha/videos.dart';

// import '../controller/profilecontroller.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   var controller = Get.put(ProfileController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF1F2F6),
//       appBar: AppBar(
//         leadingWidth: 70,
//         elevation: 0, automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         // leading: GestureDetector(
//         //   onTap: () => Get.back(),
//         //   child: Padding(
//         //     padding: const EdgeInsets.only(left: 20, bottom: 10),
//         //     child: Container(
//         //       width: 55,
//         //       height: 50,
//         //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
//         //       child: Padding(
//         //         padding: const EdgeInsets.all(16),
//         //         child: SvgPicture.asset(
//         //           'assets/leading.svg',
//         //           color: Color(0xff005D99),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         centerTitle: true,
//         title: Text(
//           'Profile',
//           style: appbarstyle,
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () async {
//               await controller.callgetprofile(context, () {
//                 Get.to(() => EditProfileScreen());
//               });
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, bottom: 10),
//               child: Container(
//                 width: 55,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5), color: white),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: SvgPicture.asset(
//                     'assets/edit.svg',
//                     color: Color(0xff005D99),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           20.horizontalSpace,
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: horizontal20Padding,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               60.verticalSpace,
//               GetBuilder<ProfileController>(builder: (context) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 83,
//                       width: 83,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage(userimages[0]),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       controller.profile == null
//                           ? 'N/A'
//                           : controller.profile!.name.toString(),
//                       style: GoogleFonts.inter(
//                           fontSize: 22,
//                           fontWeight: FontWeight.w700,
//                           color: black),
//                     ),
//                     5.verticalSpace,
//                     Text(
//                       controller.profile == null
//                           ? 'N/A'
//                           : controller.profile!.address.toString(),
//                       style: GoogleFonts.inter(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w300,
//                           color: grey),
//                     ),
//                     20.verticalSpace,
//                   ],
//                 );
//               }),
//               CustomButton(
//                 tap: () => Get.to(() => SubscriptionScreen()),
//                 ButtonText: "Buy Storage Pack",
//                 width: 300.w,
//                 textColor: white,
//                 colors: kprimary,
//                 height: 60.h,
//               ),
//               40.verticalSpace,
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'Videos',
//                   style: GoogleFonts.inter(
//                       fontSize: 19,
//                       fontWeight: FontWeight.w400,
//                       color: kprimary),
//                 ),
//               ),
//               Divider(color: kprimary, thickness: 2, height: 20),
//               Container(
//                 width: 1.sw,
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 0.95,
//                     crossAxisSpacing: 5,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemCount: roadpics.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return GestureDetector(
//                       onTap: () => Get.to(() => VideoScreen()),
//                       child: Container(
//                         height: 190,
//                         width: 190,
//                         decoration: BoxDecoration(
//                           color: reddishColor,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(5),
//                             topRight: Radius.circular(5),
//                           ),
//                           image: DecorationImage(
//                             image: AssetImage(roadpics[index]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: <Widget>[
//                                   // SvgPicture.asset('assets/folder.svg'),
//                                   // 15.horizontalSpace,
//                                   // SvgPicture.asset('assets/download.svg'),
//                                   // 15.horizontalSpace,
//                                   SvgPicture.asset('assets/share.svg'),
//                                 ],
//                               ),
//                               Expanded(
//                                 child: Center(
//                                   child: SvgPicture.asset(
//                                     'assets/videocam.svg',
//                                     height: 12,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 '11/15/2022',
//                                 style: GoogleFonts.inter(
//                                     fontWeight: FontWeight.w200,
//                                     fontSize: 14,
//                                     color: white),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/helpers/Colors.dart';
import 'package:panoptesan_alpha/screens/subscriotion.dart';

import '../controllers/profilecontroller.dart';
import '../widgets/CustomButton.dart';
import 'editProfile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
        elevation: 0, automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // leading: GestureDetector(
        //   onTap: () => Get.back(),
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 20, bottom: 10),
        //     child: Container(
        //       width: 55,
        //       height: 50,
        //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
        //       child: Padding(
        //         padding: const EdgeInsets.all(16),
        //         child: SvgPicture.asset(
        //           'assets/leading.svg',
        //           color: Color(0xff005D99),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: appbarstyle,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await controller.callgetprofile(context);
           await         Get.to(() => EditProfileScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Container(
                width: 55,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: white),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/edit.svg',
                    color: Color(0xff005D99),
                  ),
                ),
              ),
            ),
          ),
          20.horizontalSpace,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: horizontal20Padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              60.verticalSpace,
              Container(
                height: 83,
                width: 83,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(userimages[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                controller.profile == null
                    ? ''
                    : controller.profile!.userDetail!.name!,
                style: GoogleFonts.inter(
                    fontSize: 22, fontWeight: FontWeight.w700, color: black),
              ),
              5.verticalSpace,
              Text(
                controller.address == null ? '' : controller.profile!.address!,
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w300, color: grey),
              ),
              20.verticalSpace,
              CustomButton(
                tap: () => Get.to(() => SubscriptionScreen()),
                ButtonText: "Buy Storage Pack",
                width: 300.w,
                textColor: white,
                colors: kprimary,
                height: 60.h,
              ),
              40.verticalSpace,
              Text(
                'Fleet Manager',
                style: GoogleFonts.inter(
                    fontSize: 22, fontWeight: FontWeight.w700, color: black),
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 83,
                    width: 83,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(userimages.first),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  15.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Will Smith',
                        style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: black),
                      ),
                      Text(
                        'will@example.com',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff6C6C6C).withOpacity(0.53),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              20.verticalSpace,
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, setState) {
                          return AlertDialog(
                            insetPadding: EdgeInsets.symmetric(
                              vertical: 250,
                              horizontal: 50,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.zero,
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                20.verticalSpace,
                                Text(
                                  'Leave Fleet',
                                  style: GoogleFonts.inter(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: black,
                                  ),
                                ),
                                10.verticalSpace,
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(
                                    'Are you sure you want to leave the fleet',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6C6C6C),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Container(
                                          height: 51,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5)),
                                            color: bprimary,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'No',
                                              style: GoogleFonts.inter(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                builder: (BuildContext context,
                                                    setState) {
                                                  return AlertDialog(
                                                    insetPadding:
                                                        EdgeInsets.symmetric(
                                                      vertical: 210,
                                                      horizontal: 50,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    content: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        20.verticalSpace,
                                                        Image.asset(
                                                          "assets/Group 460@3x.png",
                                                          scale: 3.5,
                                                        ),
                                                        20.verticalSpace,
                                                        Text(
                                                          'Congratulations',
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0xff005D99),
                                                          ),
                                                        ),
                                                        10.verticalSpace,
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30),
                                                          child: Text(
                                                            'Your request has been send to leave the fleet. Please wait for fleet manager to accept your request \n',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xff6C6C6C),
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 51,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                5),
                                                                        bottomLeft:
                                                                            Radius.circular(5)),
                                                                    color:
                                                                        kprimary,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Go Back To Home',
                                                                      style: GoogleFonts
                                                                          .inter(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        color:
                                                                            white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: 51,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(5)),
                                            color: kprimary,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Yes',
                                              style: GoogleFonts.inter(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  width: 300.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: kprimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Leave Fleet",
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              40.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Videos',
                  style: GoogleFonts.inter(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: kprimary),
                ),
              ),
              Divider(color: kprimary, thickness: 2, height: 20),
              Container(
                width: 1.sw,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.95,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 190,
                        width: 190,
                        decoration: BoxDecoration(
                          color: reddishColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          image: DecorationImage(
                            image: AssetImage(roadpics[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  // SvgPicture.asset('assets/folder.svg'),
                                  // 15.horizontalSpace,
                                  // SvgPicture.asset('assets/download.svg'),
                                  // 15.horizontalSpace,
                                  SvgPicture.asset('assets/share.svg'),
                                ],
                              ),
                              Expanded(
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/videocam.svg',
                                    height: 12,
                                  ),
                                ),
                              ),
                              Text(
                                '11/15/2022',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    color: white),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
