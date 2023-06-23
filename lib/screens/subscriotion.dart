import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/controllers/profilecontroller.dart';

import '../Widgets/CustomButton.dart';
import '../helpers/Colors.dart';
import 'SelectPaymentMethod.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  var controller = Get.put(ProfileController());
  String dropdownValue = 'Male';
  PageController _pageSelection = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
            'Subscription Packages',
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: constraints.maxHeight / 1.5,
                    // width: 1.sw,
                    // color: appbarfont,
                    child: PageView.builder(
                      controller: PageController(initialPage: page),
                      itemCount: controller.packages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 400.h,
                          // width: 346.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  color: kprimary,
                                ),
                                width: constraints.maxWidth,
                                child: Column(
                                  children: [
                                    SizedBox(height: 53.h),
                                    Text(
                                      controller.packages[index].name,
                                      style: GoogleFonts.inter(
                                        letterSpacing: 2.05,
                                        fontSize: constraints.maxWidth * 0.05,
                                        fontWeight: FontWeight.w300,
                                        color: white,
                                      ),
                                    ),
                                    30.verticalSpace,
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.h),
                              Container(
                                // width: 209.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.check,
                                        color: white, size: 15),
                                    5.horizontalSpace,
                                    Text(
                                      '✔  Lorem ipsum dolor sit amet consectetur',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        letterSpacing: -0.04,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: kprimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: white,
                                indent: 65,
                                endIndent: 65,
                                height: 25,
                              ),
                              Container(
                                // width: 209.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.check,
                                        color: white, size: 15),
                                    5.horizontalSpace,
                                    Text(
                                      '✔  Lorem ipsum dolor sit amet consectetur',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        letterSpacing: -0.04,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: kprimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: white,
                                indent: 65,
                                endIndent: 65,
                                height: 25,
                              ),
                              Container(
                                // width: 209.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.check,
                                        color: white, size: 15),
                                    5.horizontalSpace,
                                    Text(
                                      '✔  Lorem ipsum dolor sit amet consectetur',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        letterSpacing: -0.04,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: kprimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: white,
                                indent: 65,
                                endIndent: 65,
                              ),
                              Container(
                                // width: 209.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.check,
                                        color: white, size: 15),
                                    5.horizontalSpace,
                                    Text(
                                      'Lorem ipsum dolor sit amet consectetur',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        letterSpacing: -0.04,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: white,
                                indent: 65,
                                endIndent: 65,
                                height: 25,
                              ),
                              SizedBox(height: 17.h),
                              Container(
                                color: Colors.white,
                                width: 170.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .packages[index].currencySymbol,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            letterSpacing: -0.14,
                                            fontSize: 35.sp,
                                            fontWeight: FontWeight.w700,
                                            color: kprimary,
                                          ),
                                        ),
                                        Text(
                                          " " +
                                              controller.packages[index].price
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            letterSpacing: -0.29,
                                            fontSize: 72.sp,
                                            fontWeight: FontWeight.w700,
                                            color: kprimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Per Month',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          letterSpacing: -0.06,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: kprimary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // CustomButton(
                              //   tap: () => Get.to(() => CardScreen()),
                              //   ButtonText: "Try Now",
                              //   width: 300.w,
                              //   textColor: kprimary,
                              //   colors: white,
                              //   height: 50.h,
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              page--;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.arrowLeftLong,
                                  color: kprimary,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              page++;
                              print('index');
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.arrowRightLong,
                                  color: kprimary,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              20.verticalSpace,
              Center(
                child: Container(
                  width: constraints.maxWidth / 1.2,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => CardScreen());
                      // Get.to(() => SubscriptionScreen());
                      // Button action goes here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      primary: kprimary,
                    ),
                    child: const Text(
                      'Buy Storage Pack',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
