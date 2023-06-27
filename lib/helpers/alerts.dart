  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/helpers/Colors.dart';

class  Alert{



    showalert(String field, BuildContext context) async{

    return    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        insetPadding: horizontal40Padding,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: 0.h),
                          actionsPadding: EdgeInsets.zero,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              30.verticalSpace,

                              Text(
                                "Alert!",
                                style: GoogleFonts.inter(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: black),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "$field field is empty",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                              ),
                              SizedBox(height: 30.h),

                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Container(
                                          width: 1.sw,
                                          height: 51.h,
                                          decoration: BoxDecoration(
                                            color: bprimary,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Close',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: white,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              // CustomButton(
                              //   tap: () {
                              //     Get.to(() => MainScreen());
                              //   },
                              //   width: 1.sw,
                              //   height: 60.h,
                              //   ButtonText: 'Back to Home',
                              //   gradients: bprimaryColor,
                              // ),
                            ],
                          ),
                        );
                      },
                    );
     
    }

}