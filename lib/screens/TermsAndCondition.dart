import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helpers/Colors.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
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
          "Terms & Condition",
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
                Text(
                  "Lorem ipsum dolor sit amet consectetur adipiscing, elit congue nisi rutrum platea lacinia sapien, sed vel cras torquent scelerisque. Tempus pharetra quam congue natoque aptent sollicitudin et bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id pulvinar. Inceptos phasellus magnis netus at primis sodales torquent cras, lacus potenti habitant lobortis aliquam turpis risus enim, cubilia natoque ligula aenean gravida nascetur curae.bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id pulvinar. Inceptos phasellus magnis netus at primis sodales torquent cras, lacus potenti habitant lobortis aliquam turpis risus enim, cubilia natoque ligula aenean gravida nascetur curae.bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id pulvinar. Inceptos phasellus magnis netus at primis sodales torquent cras, lacus potenti habitant lobortis aliquam turpis risus enim, cubilia natoque ligula aenean gravida nascetur curae.",
                  style: TextStyle(
                    color: Color(0xff6C6C6C),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
