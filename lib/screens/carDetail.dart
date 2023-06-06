import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/CustomButton.dart';
import '../helpers/Colors.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen({super.key});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
          'Car Detail',
          style: appbarstyle,
        ),
      ),
      body: Padding(
        padding: horizontal20Padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 213.h,
              width: 388.w,
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/car.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            20.verticalSpace,
            Text('BMW 8 Series', style: bold28Black),
            20.verticalSpace,
            Text('Model', style: bold17black),
            Text('BMW 8 Series 840i XDrive Coupe', style: light13black_inter),
            30.verticalSpace,
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Purchase Date', style: bold17black),
                    5.verticalSpace,
                    Text('09/2003', style: light13black_inter),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Lorem ipsum', style: bold17black),
                    5.verticalSpace,
                    Text('Inceptos phasellu', style: light13black_inter),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Lorem ipsum', style: bold17black),
                    5.verticalSpace,
                    Text('Inceptos phasellu', style: light13black_inter),
                  ],
                ),
              ],
            ),
            30.verticalSpace,
            Text('Description', style: bold17black),
            5.verticalSpace,
            Container(
              height: 192.h,
              width: 388.w,
              child: Text(
                'Lorem ipsum dolor sit amet Consectetur adipiscing, elit congue nisi rutrum platea lacinia sapien, sed vel cras torquent scelerisque. Tempus pharetra quam congue natoque aptent sollicitudin et bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id pulvinar. Inceptos phasellus magnis netus at primis sodales torquent cras, lacus potenti habitant lobortis aliquam turpis risus enim, cubilia natoque ligula aenean gravida nascetur curae.bibendum ullamcorper fames facilisis urna, ac tempor arcu ridiculus proin etiam diam taciti vivamus id pulvinar.',
                textAlign: TextAlign.left,
                style: light13black_inter,
              ),
            ),
            20.verticalSpace,
            CustomButton(
              tap: () => Get.back(),
              ButtonText: "Save Details",
              width: 0.9.sw,
              textColor: white,
              colors: kprimary,
              height: 60.h,
            )
          ],
        ),
      ),
    );
  }
}
