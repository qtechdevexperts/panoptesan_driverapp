import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/Widgets/CustomButton.dart';
import 'package:panoptesan_alpha/screens/AboutApp.dart';
import 'package:panoptesan_alpha/screens/Discailmer.dart';
import 'package:panoptesan_alpha/screens/PrivacyPolicy.dart';
import 'package:panoptesan_alpha/screens/TermsAndCondition.dart';
import 'package:panoptesan_alpha/screens/carDetail.dart';

class CarHistoryScreen extends StatefulWidget {
  const CarHistoryScreen({super.key});

  @override
  State<CarHistoryScreen> createState() => _CarHistoryScreenState();
}

class _CarHistoryScreenState extends State<CarHistoryScreen> {
  var switchnot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
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
          "Viewed Car History",
          style: appbarstyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: roadpics.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => CarDetailScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      width: 1.sw,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 74,
                              width: 82,
                              decoration: BoxDecoration(
                                color: reddishColor,
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(roadpics[0]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        SvgPicture.asset(
                                          'assets/share.svg',
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/videocam.svg',
                                          height: 10,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '11/15/2022',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 9,
                                        color: white,
                                        letterSpacing: -0.32,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            15.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lorem ispum",
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                5.verticalSpace,
                                Text(
                                  "Lorem ipsum dolor sit amet...",
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            15.horizontalSpace,
                            Container(
                              height: 40.h,
                              width: 83.w,
                              decoration: BoxDecoration(
                                color: kprimaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "View",
                                  style: GoogleFonts.inter(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              15.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
