import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helpers/Colors.dart';
import 'home.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        leadingWidth: 70,
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
          "About App",
          style: appbarstyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                10.verticalSpace,
                // Text(
                //   "Lorem ipsum dolor sit amet consectetur adipiscing, elit congue nisi rutrum platea lacinia sapien, sed vel cras torquent scelerisque. Tempus pharetra quam congue natoque aptent sollicitudin et bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id pulvinar. Inceptos phasellus magnis netus at primis sodales torquent cras, lacus potenti habitant lobortis aliquam turpis risus enim, cubilia natoque ligula aenean gravida nascetur curae.bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id pulvinar. Inceptos phasellus magnis netus at primis sodales torquent cras, lacus potenti habitant lobortis aliquam turpis risus enim, cubilia natoque ligula aenean gravida nascetur curae.bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id pulvinar. Inceptos phasellus magnis netus at primis sodales torquent cras, lacus potenti habitant lobortis aliquam turpis risus enim, cubilia natoque ligula aenean gravida nascetur curae.",
                //   style: TextStyle(
                //     color: Color(0xff6C6C6C),
                //     fontWeight: FontWeight.w300,
                //     fontSize: 18,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
