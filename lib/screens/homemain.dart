import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/controllers/BottomController.dart';
import 'package:panoptesan_alpha/screens/Notifications.dart';

import 'dart:math' as math;

import '../controllers/profilecontroller.dart';
import 'Archive.dart';
import 'NewArchive.dart';
import 'Profile.dart';
import 'StartRecording.dart';
import 'home.dart';
import 'newprofile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final prof = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prof.setprofile();
  }

  final bt = Get.put(BottomController());
  var screens = [
    StartRecordingScreen(),
    NewArchive(),
    HomeScreen(),
    NOtificationsScreen(),
    NewProfile(),
  ];
  void _onItemTaapped(int index) {
    bt.navBarChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<BottomController>(
          builder: (_) =>   IndexedStack(
index: _.navigationBarIndexValue,
            children: [

   StartRecordingScreen(),
    NewArchive(),
    HomeScreen(),
    NOtificationsScreen(),
    NewProfile(),

            ],
          ), 
        ),
        extendBody: true,
        bottomNavigationBar: GetBuilder<BottomController>(
          builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // bt.navigationBarIndexValue == 0
              //     ? Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 30.w),
              //         child: Container(
              //           height: 56.h,
              //           width: 150.w,
              //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: <Widget>[
              //               SvgPicture.asset('assets/panic.svg'),
              //             ],
              //           ),
              //         ),
              //       )
              //     : Container(),
              25.verticalSpace,
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    ClipPath(
                      clipper: BottomNavClipper(),
                      child: Container(
                        // height: 96.h,
                        width: 0.9.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border: Border.all(
                              width: 0.5.w,
                              color: Colors.grey.withOpacity(0.75)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.35),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: [
                                    IconButton(
                                        constraints: BoxConstraints(),
                                        color: Colors.grey,
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          _onItemTaapped(0);
                                        },
                                        icon: Icon(Icons.mic)),
                                    //    SizedBox(height: 5.h),
                                    Text(
                                      "Record",
                                      style: GoogleFonts.inter(
                                        color: Color(0xff0A0D26),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    IconButton(
                                        constraints: BoxConstraints(),
                                        color: Colors.grey,
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          _onItemTaapped(1);
                                        },
                                        icon: Icon(Icons.folder)),
                                    Text(
                                      "Archive",
                                      style: GoogleFonts.inter(
                                        color: Color(0xff0A0D26),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              55.horizontalSpace,
                              // GestureDetector(
                              //   onTap: () {
                              //     setState(() {
                              //       _onItemTaapped(2);
                              //     });
                              //   },
                              //   child: Container(
                              //     child: Column(
                              //       children: [
                              //         SvgPicture.asset('assets/circle.svg'),
                              //         SizedBox(height: 5.h),
                              //         Text(
                              //           "Record",
                              //           style: GoogleFonts.inter(
                              //             color: Color(0xff0A0D26),
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.w300,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Container(
                                child: Column(
                                  children: [
                                    IconButton(
                                        constraints: BoxConstraints(),
                                        color: Colors.grey,
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          _onItemTaapped(3);
                                        },
                                        icon: Icon(Icons.notifications)),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "Notifications",
                                      style: GoogleFonts.inter(
                                        color: Color(0xff0A0D26),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              prof.profile?.userDetail?.profileImg == null
                                  ? GestureDetector(
                                      onTap: () {
                                        _onItemTaapped(4);
                                      },
                                      child: Container(
                                        width: 45.w,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "http://www.gravatar.com/avatar/?d=mp"))),
                                      ),
                                    )
                                  : GetBuilder<ProfileController>(
                                    builder: (_) {
                                      return GestureDetector(
                                          onTap: () {
                                            _onItemTaapped(4);
                                          },
                                          child: Container(
                                            width: 45.w,
                                            height: 45.h,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(_
                                                            .profile
                                                            ?.userDetail
                                                            ?.profileImg ??
                                                        ''))),
                                          ),
                                        );
                                    }
                                  )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      child: Center(
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(
                            math.pi / 4,
                          ),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xff017cb7),
                                    Color(0xff36b5e0),
                                  ],
                                )),
                            child: InkWell(
                              splashColor: Colors.blueAccent,
                              onTap: () {
                                print('tapped');
                                _onItemTaapped(2);
                              },
                              child: Center(
                                child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationZ(
                                      -math.pi / 4,
                                    ),
                                    child: Image.asset(
                                      "assets/Icon material-home.png",
                                      scale: 3.5,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
              20.verticalSpace,
            ],
          ),
        ));
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: Colors.transparent,
  //       body: GetBuilder<BottomController>(
  //         builder: (_) => screens[bt.navigationBarIndexValue],
  //       ),
  //       extendBody: true,
  //       bottomNavigationBar: GetBuilder<BottomController>(
  //           builder: (_) => BottomNavigationBar(
  //                 //  fixedColor: Colors.black,
  //                 type: BottomNavigationBarType.fixed,
  //                 unselectedLabelStyle:
  //                     TextStyle(color: Colors.black, fontSize: 14),
  //                 fixedColor: Colors.black,
  //                 unselectedItemColor: Colors.black,
  //                 currentIndex: bt.navigationBarIndexValue,
  //                 // selectedItemColor:
  //                 //     Colors.black, // set the color for the selected item
  //                 // unselectedItemColor:
  //                 //     Colors.black, // set the color for the unselected items
  //                 // selectedLabelStyle: TextStyle(
  //                 //     color:
  //                 //         Colors.black), // set the color for the selected label
  //                 // unselectedLabelStyle: TextStyle(
  //                 //     color: Colors
  //                 //         .black), // set the color for the unselected labels
  //                 onTap: (index) {
  //                   _onItemTaapped(index);
  //                 },
  //                 items: [
  //                   BottomNavigationBarItem(
  //                       label: 'Home',
  //                       icon: SvgPicture.asset('assets/home.svg')),
  //                   BottomNavigationBarItem(
  //                       label: 'Archive',
  //                       icon: SvgPicture.asset('assets/archive.svg')),
  //                   BottomNavigationBarItem(
  //                       label: 'Record',
  //                       icon: SvgPicture.asset('assets/circle.svg')),
  //                   BottomNavigationBarItem(
  //                       label: 'Notifications',
  //                       icon: SvgPicture.asset('assets/bel.svg')),
  //                   BottomNavigationBarItem(
  //                       label: 'Profile',
  //                       icon: SvgPicture.asset('assets/person.svg')),
  //                 ],

  //                 //  Column(
  //                 //     mainAxisAlignment: MainAxisAlignment.end,
  //                 //     crossAxisAlignment: CrossAxisAlignment.end,
  //                 //     children: [
  //                 //       bt.navigationBarIndexValue == 0
  //                 //           ? Padding(
  //                 //               padding: EdgeInsets.symmetric(horizontal: 30.w),
  //                 //               child: Container(
  //                 //                 height: 56.h,
  //                 //                 width: 150.w,
  //                 //                 decoration: BoxDecoration(
  //                 //                     borderRadius: BorderRadius.circular(5), color: white),
  //                 //                 child: Row(
  //                 //                   mainAxisAlignment: MainAxisAlignment.center,
  //                 //                   children: <Widget>[
  //                 //                     SvgPicture.asset('assets/panic.svg'),
  //                 //                   ],
  //                 //                 ),
  //                 //               ),
  //                 //             )
  //                 //           : Container(),
  //                 //       20.verticalSpace,
  //                 //       Container(
  //                 //         height: 98.h,
  //                 //         decoration: BoxDecoration(
  //                 //           borderRadius: BorderRadius.only(
  //                 //             topRight: Radius.circular(23.r),
  //                 //             topLeft: Radius.circular(23.r),
  //                 //           ),
  //                 //           color: Color(0xffF1F2F6),
  //                 //         ),
  //                 //         child: Padding(
  //                 //           padding:
  //                 //               const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //                 //           child: Row(
  //                 //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 //             children: <Widget>[
  //                 //               GestureDetector(
  //                 //                 onTap: () {
  //                 //                   setState(() {
  //                 //                     _onItemTaapped(0);
  //                 //                   });
  //                 //                 },
  //                 //                 child: Container(
  //                 //                   child: Column(
  //                 //                     children: [
  //                 //                       SvgPicture.asset('assets/home.svg'),
  //                 //                       SizedBox(height: 10.h),
  //                 //                       Text(
  //                 //                         "Home",
  //                 //                         style: GoogleFonts.inter(
  //                 //                           color: Color(0xff0A0D26),
  //                 //                           fontSize: 12,
  //                 //                           fontWeight: FontWeight.w300,
  //                 //                         ),
  //                 //                       ),
  //                 //                     ],
  //                 //                   ),
  //                 //                 ),
  //                 //               ),
  //                 //               GestureDetector(
  //                 //                 onTap: () {
  //                 //                   setState(() {
  //                 //                     _onItemTaapped(1);
  //                 //                   });
  //                 //                 },
  //                 //                 child: Container(
  //                 //                   child: Column(
  //                 //                     children: [
  //                 //                       SvgPicture.asset(
  //                 //                         'assets/archive.svg',
  //                 //                         height: 20,
  //                 //                         color: kprimary,
  //                 //                       ),
  //                 //                       SizedBox(height: 10.h),
  //                 //                       Text(
  //                 //                         "Archive",
  //                 //                         style: GoogleFonts.inter(
  //                 //                           color: Color(0xff0A0D26),
  //                 //                           fontSize: 12,
  //                 //                           fontWeight: FontWeight.w300,
  //                 //                         ),
  //                 //                       ),
  //                 //                     ],
  //                 //                   ),
  //                 //                 ),
  //                 //               ),
  //                 //               GestureDetector(
  //                 //                 onTap: () {
  //                 //                   setState(() {
  //                 //                     _onItemTaapped(2);
  //                 //                   });
  //                 //                 },
  //                 //                 child: Container(
  //                 //                   child: Column(
  //                 //                     children: [
  //                 //                       SvgPicture.asset('assets/circle.svg'),
  //                 //                       SizedBox(height: 10.h),
  //                 //                       Text(
  //                 //                         "Record",
  //                 //                         style: GoogleFonts.inter(
  //                 //                           color: Color(0xff0A0D26),
  //                 //                           fontSize: 12,
  //                 //                           fontWeight: FontWeight.w300,
  //                 //                         ),
  //                 //                       ),
  //                 //                     ],
  //                 //                   ),
  //                 //                 ),
  //                 //               ),
  //                 //               GestureDetector(
  //                 //                 onTap: () {
  //                 //                   setState(() {
  //                 //                     _onItemTaapped(3);
  //                 //                   });
  //                 //                 },
  //                 //                 child: Container(
  //                 //                   child: Column(
  //                 //                     children: [
  //                 //                       SvgPicture.asset('assets/bel.svg'),
  //                 //                       SizedBox(height: 10.h),
  //                 //                       Text(
  //                 //                         "Notifications",
  //                 //                         style: GoogleFonts.inter(
  //                 //                           color: Color(0xff0A0D26),
  //                 //                           fontSize: 12,
  //                 //                           fontWeight: FontWeight.w300,
  //                 //                         ),
  //                 //                       ),
  //                 //                     ],
  //                 //                   ),
  //                 //                 ),
  //                 //               ),
  //                 //               GestureDetector(
  //                 //                 onTap: () {
  //                 //                   setState(() {
  //                 //                     _onItemTaapped(4);
  //                 //                   });
  //                 //                 },
  //                 //                 child: Container(
  //                 //                   child: Column(
  //                 //                     children: [
  //                 //                       SvgPicture.asset('assets/person.svg'),
  //                 //                       SizedBox(height: 10.h),
  //                 //                       Text(
  //                 //                         "Profile",
  //                 //                         style: GoogleFonts.inter(
  //                 //                           color: Color(0xff0A0D26),
  //                 //                           fontSize: 12,
  //                 //                           fontWeight: FontWeight.w300,
  //                 //                         ),
  //                 //                       ),
  //                 //                     ],
  //                 //                   ),
  //                 //                 ),
  //                 //               ),
  //                 //             ],
  //                 //           ),
  //                 //         ),
  //                 //       ),
  //                 //     ],
  //                 //   ),
  //                 // ),
  //               )));
  // }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var w = size.width;
    var h = size.height;
    var curveHeight = 50;

    path.lineTo(w / 2 - curveHeight, 0);
    path.quadraticBezierTo(
        w / 2.01, curveHeight * 2.3, w / 1.99 + curveHeight, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
