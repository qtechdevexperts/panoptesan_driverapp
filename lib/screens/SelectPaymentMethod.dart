import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Button.dart';
import '../Widgets/CustomButton.dart';
import '../helpers/Colors.dart';
import 'AddCard.dart';
import 'home.dart';
import 'homemain.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF1F2F6),
        appBar: AppBar(
          leadingWidth: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading:Padding(
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
            'Select Payment\n         Method',
            style: appbarstyle,
          ),
   
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CreditCardWidget(
                glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                // bankName: 'Axis Bank',
                frontCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                backCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                //  cardBgColor: AppColors.cardBgColor,
                backgroundImage:
                    useBackgroundImage ? 'assets/card_bg.png' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  // CustomCardTypeIcon(
                  //   cardType: CardType.mastercard,
                  //   cardImage: Image.asset(
                  //     'assets/mastercard.png',
                  //     height: 48,
                  //     width: 48,
                  //   ),
                  // ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: false,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        textColor: Colors.black,
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Number',
                          labelStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: white,
                          
                          hintText: '............',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 10, 0, 0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none),
                        ),
                        expiryDateDecoration: InputDecoration(
                        
                          labelStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: white,
                          hintStyle: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff8b8b8b)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none),
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.black),

                          filled: true,
                          fillColor: white,
                          //   hintText: '............',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff8b8b8b)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: white,
                          labelText: 'Card holder Name',
                          hintText: 'Card holder Name',
                          hintStyle: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff8b8b8b)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none),
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        //   width: constraint.maxWidth / 1.2,
                        child: ElevatedButton(
                          onPressed: () async {
                            showDialog(
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
                                      Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              'assets/check (2).png'),
                                        ),
                                      ),
                                      Text(
                                        "Congratulations ",
                                        style: GoogleFonts.inter(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            color: black),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "Payment Done \n Successfully ",
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
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Go Back To Home',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                            _onValidate();
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
                            ' Continue ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
