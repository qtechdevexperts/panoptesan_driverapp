import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/controllers/profilecontroller.dart';

import '../Widgets/CustomButton.dart';
import '../helpers/Colors.dart';
import 'SelectPaymentMethod.dart';
import 'home.dart';

import 'package:http/http.dart' as http;

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
          leading: Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleIconButton(
              backgroundColor: Color(0xFF007AB6),
              icon: Icons.arrow_back,
              iconColor: Colors.white,
              onPressed: () {
                Get.back();
              },
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
                    onPressed: () async {
                      //  Get.to(() => CardScreen());

                      var model = await createPaymentIntent('100', "USD");

                      BillingDetails billingDetails = new BillingDetails(
                          address: Address(
                              city: "",
                              country: "",
                              line1: "",
                              line2: "",
                              postalCode: "",
                              state: ""),
                          email: "",
                          name: "",
                          phone: "");

                      await Stripe.instance.initPaymentSheet(
                        paymentSheetParameters: SetupPaymentSheetParameters(
                            merchantDisplayName: 'TEST',
                            paymentIntentClientSecret: model["client_secret"],
                            //    customerEphemeralKeySecret: eph.secret,
                            customerId: model["customer"],
                            style: ThemeMode.system,
                            billingDetails: billingDetails,
                            customFlow: true),
                      );
                      await Stripe.instance.presentPaymentSheet();

                      Get.back();
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

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51NG3fqKsOuXXDZeS3dpErpgvFsDZH7QVZ7pnz9YUG94WOUdR25GkzE5EdpFiQ4xCUcEjaNb28ojjqEtWVUPLNgyn00X4yfukrj',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
