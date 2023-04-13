import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/screens/Archive.dart';
import 'package:panoptesan_alpha/screens/Notifications.dart';
import 'package:panoptesan_alpha/screens/Profile.dart';
import 'package:panoptesan_alpha/screens/StartRecording.dart';
import 'package:panoptesan_alpha/screens/home.dart';

import '../Helper/Controller.dart';
import '../Helper/golbal.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bt = Get.put(BottomController());
  var screens = [
    HomeScreen(),
    ArchiveScreen(),
    StartRecordingScreen(),
    NOtificationsScreen(),
    ProfileScreen(),
  ];
  void _onItemTaapped(int index) {
    bt.navBarChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<BottomController>(
        builder: (_) => screens[bt.navigationBarIndexValue],
      ),
      extendBody: true,
      bottomNavigationBar: GetBuilder<BottomController>(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            bt.navigationBarIndexValue == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                      height: 56.h,
                      width: 150.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset('assets/panic.svg'),
                        ],
                      ),
                    ),
                  )
                : Container(),
            25.verticalSpace,
            Container(
              height: 98.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(23.r),
                  topLeft: Radius.circular(23.r),
                ),
                color: Color(0xffF1F2F6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _onItemTaapped(0);
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/home.svg'),
                            SizedBox(height: 10.h),
                            Text(
                              "Home",
                              style: GoogleFonts.inter(
                                color: Color(0xff0A0D26),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _onItemTaapped(1);
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/archive.svg',
                              height: 20,
                              color: kprimary,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Archive",
                              style: GoogleFonts.inter(
                                color: Color(0xff0A0D26),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _onItemTaapped(2);
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/circle.svg'),
                            SizedBox(height: 10.h),
                            Text(
                              "Record",
                              style: GoogleFonts.inter(
                                color: Color(0xff0A0D26),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _onItemTaapped(3);
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/bel.svg'),
                            SizedBox(height: 10.h),
                            Text(
                              "Notifications",
                              style: GoogleFonts.inter(
                                color: Color(0xff0A0D26),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _onItemTaapped(4);
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/person.svg'),
                            SizedBox(height: 10.h),
                            Text(
                              "Profile",
                              style: GoogleFonts.inter(
                                color: Color(0xff0A0D26),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
