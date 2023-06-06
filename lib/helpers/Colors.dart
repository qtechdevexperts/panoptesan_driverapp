import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const kprimaryColor = Color(0xff2875AE);
const btnprimaryColor = Color(0xff4d98f1);
const Authlbcolor = Color(0xff080847);
const bprimaryColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xff2A7EE0),
    Color(0xff3FC1F6),
  ],
);
const cprimaryColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xff2A7EE0),
    Color(0xff080848),
  ],
);
const bgcolor = Color(0xffF4F7FE);

List userimages = [
  "assets/p1.jpg",
  "assets/p2.jpg",
  "assets/p3.jpg",
  "assets/p4.jpg",
  "assets/p5.jpg",
  "assets/p6.jpg",
  "assets/p1.jpg",
];
List tools = [
  "assets/t1.jpg",
  "assets/t2.jpg",
  "assets/t3.jpg",
  "assets/t4.jpg",
  "assets/t5.jpg",
  "assets/t1.jpg",
  "assets/t2.jpg",
  "assets/t3.jpg",
  "assets/t4.jpg",
  "assets/t5.jpg",
  "assets/t1.jpg",
  "assets/t2.jpg",
  "assets/t3.jpg",
  "assets/t4.jpg",
  "assets/t5.jpg",
  "assets/t1.jpg",
  "assets/t2.jpg",
  "assets/t3.jpg",
  "assets/t4.jpg",
  "assets/t5.jpg",
];
List pics1 = [
  "assets/product1.jpg",
  "assets/product2.jpg",
  "assets/product3.jpg",
  "assets/product4.jpg",
  "assets/product5.jpg",
  "assets/product6.jpg",
  "assets/product7.jpg",
  "assets/product8.jpg",
  "assets/product9.jpg",
  "assets/product10.jpg",
  "assets/product12.jpg",
  "assets/product3.jpg",
  "assets/product1.jpg",
  "assets/product2.jpg",
  "assets/product3.jpg",
  "assets/product4.jpg",
  "assets/product5.jpg",
  "assets/product6.jpg",
  "assets/product7.jpg",
  "assets/product8.jpg",
  "assets/product9.jpg",
  "assets/product10.jpg",
  "assets/product12.jpg",
  "assets/product3.jpg",
];
List roadpics = [
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_5ae2a041-342d-40e3-a554-618ff1ba14e6.png",
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_1437c313-ab4d-4e22-9f5a-d445ea5c4e7e.png",
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_b1feb728-53f7-4a01-8e44-c571764721eb.png",
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_f698ba90-d208-4093-b1fe-2f574628f156.png",
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_fc013678-3690-42bb-b1b3-0f7a4298d7ad.png",
  "assets/bsten3_background_for_a_landing_page_uxui_blue_white_car_dashbo_3c6c31e8-7b15-4043-8498-9aad7aed39c3.png",
  "assets/bsten3_create_a_background_for_a_website_with_a_light_blue_wash_0895d3ee-1404-4de0-8540-40020f98b625.png",
  "assets/bsten3_hyperrealistic_photorealistic_background_for_a_website_c_826e7275-585d-4ba9-93bd-cb38583d7353.png",
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_5ae2a041-342d-40e3-a554-618ff1ba14e6.png",
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_1437c313-ab4d-4e22-9f5a-d445ea5c4e7e.png",
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_b1feb728-53f7-4a01-8e44-c571764721eb.png",
  "assets/bsten3_background_for_a_landing_page_ux_and_ui_blue_white_car_d_f698ba90-d208-4093-b1fe-2f574628f156.png",
];
List names = [
  "James",
  "John",
  "Oliver",
  "Harry",
  "Charlie",
  "George",
  "Rhys",
  "Michael",
  "Joe",
  "Joseph",
  "James",
  "John",
  "Oliver",
  "Harry",
  "Charlie",
  "George",
  "Rhys",
  "Michael",
  "Joe",
  "Joseph",
  "Joe",
  "Joseph",
  "James",
  "John",
  "Oliver",
];
var remo;

var googlecolor = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xffDC4E41),
    Color(0xffFF9A56),
  ],
);
var fbcolor = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xff3A559F),
    Color(0xff5880EB),
  ],
);
const kprimary = Color(0xff005D99);
const bprimary = Color(0xff43B2FF);

var white = Colors.white;
var whitelite = Colors.white.withOpacity(0.25);
var black = Colors.black;
var drawerfontcolor = Color(0xff080848);
var grey = Color(0xff667080);
var mustard = Color(0xffCFA234);
var lightMustard = Color(0xffEEDBA9);
var appbarfont = Color(0xff475161);
var darkColor = Color(0xff44340B).withOpacity(0.2);
var reddishColor = Color(0xffFF3A56);
var whitish = Color(0xffD0D3FC);
var hinttxtcolor = Color(0xff667080);
AssetImage background = AssetImage("assets/slicing/Vendor/Group 1233.png");
AssetImage userImage = AssetImage("assets/slicing/Vendor/Ellipse 55.png");
var appbarstyle = GoogleFonts.inter(
    fontSize: 22, color: Color(0xff2C2C2C), fontWeight: FontWeight.w700);

var medium12 = GoogleFonts.inter(
    fontSize: 12, color: Color(0xff667080), fontWeight: FontWeight.w400);
var medium11 = GoogleFonts.inter(
    fontSize: 11, color: Color(0xff667080), fontWeight: FontWeight.w400);
var medium14 = GoogleFonts.inter(
    fontSize: 14, color: Color(0xff667080), fontWeight: FontWeight.w400);
var medium18 = GoogleFonts.inter(
    fontSize: 18, color: Color(0xff667080), fontWeight: FontWeight.w600);
var medium16 = GoogleFonts.inter(
    fontSize: 16, color: Color(0xff667080), fontWeight: FontWeight.w500);
var semibold16 = GoogleFonts.inter(
    fontSize: 16, color: appbarfont, fontWeight: FontWeight.w600);
var bold16 = GoogleFonts.inter(
    fontSize: 16, color: appbarfont, fontWeight: FontWeight.w700);
var bold17black =
    GoogleFonts.inter(fontSize: 17, color: black, fontWeight: FontWeight.w700);

var bold28Black =
    GoogleFonts.inter(fontSize: 28, color: black, fontWeight: FontWeight.w700);

var semiBold25 = GoogleFonts.inter(
    fontSize: 25, color: Color(0xff667080), fontWeight: FontWeight.w600);

var semiBold18 = GoogleFonts.inter(
    fontSize: 18, color: Color(0xff475161), fontWeight: FontWeight.w600);
var textfieldStyle =
    GoogleFonts.inter(fontSize: 14, color: white, fontWeight: FontWeight.w400);
var semiBold20 = GoogleFonts.inter(
    fontSize: 20, color: appbarfont, fontWeight: FontWeight.w600);
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
var semibold16kprimary = GoogleFonts.inter(
    fontSize: 16, color: kprimary, fontWeight: FontWeight.w600);
var regular12 = GoogleFonts.inter(
    fontSize: 12, color: appbarfont, fontWeight: FontWeight.w400);
var regular15 = GoogleFonts.inter(
    fontSize: 15, color: appbarfont, fontWeight: FontWeight.w400);
var regular14Kp_inter = GoogleFonts.inter(
    fontSize: 14, color: kprimary, fontWeight: FontWeight.w400);
var regular14red_inter = GoogleFonts.inter(
    fontSize: 14, color: Color(0xffE23939), fontWeight: FontWeight.w400);

var semibold16grey_inter = GoogleFonts.inter(
    fontSize: 16, color: appbarfont, fontWeight: FontWeight.w600);
var medium14Kp_inter = GoogleFonts.inter(
    fontSize: 14, color: appbarfont, fontWeight: FontWeight.w600);
var regular10grey_poppins = GoogleFonts.inter(
    fontSize: 10, color: appbarfont, fontWeight: FontWeight.w400);
var regular11grey_poppins = GoogleFonts.inter(
    fontSize: 11, color: appbarfont, fontWeight: FontWeight.w400);

var horizontal20Padding = EdgeInsets.symmetric(horizontal: 20);
var horizontal40Padding = EdgeInsets.symmetric(horizontal: 40);

/////////////////////////////////////////Inter Style/////////////////////////////////
var semibold15kp_inter = GoogleFonts.inter(
    fontSize: 16, color: kprimary, fontWeight: FontWeight.w600);
var semibold32white_inter =
    GoogleFonts.inter(fontSize: 32, color: white, fontWeight: FontWeight.w600);
var light15kp_inter = GoogleFonts.inter(
    fontSize: 15, color: kprimary, fontWeight: FontWeight.w300);
var light13black_inter =
    GoogleFonts.inter(fontSize: 13, color: black, fontWeight: FontWeight.w300);

var regular19kp_inter = GoogleFonts.inter(
    fontSize: 19, color: kprimary, fontWeight: FontWeight.w400);
var bold19kp_inter = GoogleFonts.inter(
    fontSize: 19, color: kprimary, fontWeight: FontWeight.w700);
// var semibold15kp_inter = GoogleFonts.inter(fontSize: 16, color: kprimary, fontWeight: FontWeight.w600);
