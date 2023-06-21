import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/helpers/Colors.dart';

import '../controllers/profilecontroller.dart';

class NOtificationsScreen extends StatefulWidget {
  const NOtificationsScreen({super.key});

  @override
  State<NOtificationsScreen> createState() => _NOtificationsScreenState();
}

class _NOtificationsScreenState extends State<NOtificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF1F2F6),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: GestureDetector(
          //   onTap: () => Get.back(),
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20, bottom: 10),
          //     child: Container(
          //       width: 55,
          //       height: 50,
          //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white),
          //       child: Padding(
          //         padding: const EdgeInsets.all(16),
          //         child: SvgPicture.asset(
          //           'assets/leading.svg',
          //           color: Color(0xff005D99),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          centerTitle: true,
          title: Text(
            'Notifications',
            style: appbarstyle,
          ),
        ),
        body: GetBuilder<ProfileController>(
          builder: (controller) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.notificationList.length,
              itemBuilder: (context, index) {
                // Use the controller to access the profile data or methods
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      //  height: 90,
                      child: ListTile(
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Lorem Ipsum'),
                            const SizedBox(
                              height: 5,
                            ),
                            const ColoredCircleText(
                              circleColor: Colors.blue,
                              text: "0",
                              textColor: Colors.white,
                            )
                          ],
                        ),
                        title: Text(controller.notificationList[index].body),
                        // subtitle: Text('Lorem Ipsum'),
                        // leading: Container(
                        //   height: 50,
                        //   width: 50,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     image: DecorationImage(
                        //       image: AssetImage(userimages[
                        //           0]), // Replace with your image data
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ) //   body: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       30.verticalSpace,
        //       Container(
        //         height: 0.85.sh,
        //         width: 1.sw,
        //         decoration: BoxDecoration(
        //           color: white,
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(37),
        //             topRight: Radius.circular(37),
        //           ),
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        //           child: SingleChildScrollView(
        //             child: Column(
        //               children: <Widget>[
        //                 ListView.builder(
        //                   physics: NeverScrollableScrollPhysics(),
        //                   shrinkWrap: true,
        //                   itemCount: 5,
        //                   itemBuilder: (BuildContext context, int index) {
        //                     return Column(
        //                       children: [
        //                         Container(
        //                           margin: EdgeInsets.only(bottom: 0),
        //                           width: 1.sw,
        //                           child: Row(
        //                             crossAxisAlignment: CrossAxisAlignment.center,
        //                             children: <Widget>[
        //                               Container(
        //                                 height: 65,
        //                                 width: 65,
        //                                 decoration: BoxDecoration(
        //                                   shape: BoxShape.circle,
        //                                   image: DecorationImage(
        //                                     image: AssetImage(userimages[0]),
        //                                     fit: BoxFit.cover,
        //                                   ),
        //                                 ),
        //                               ),
        //                               10.horizontalSpace,
        //                               Column(
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: <Widget>[
        //                                   Text(
        //                                     'Lorem ispum',
        //                                     style: bold17black,
        //                                   ),
        //                                   Text(
        //                                     'Lorem ispum',
        //                                     style: light13black_inter,
        //                                   ),
        //                                 ],
        //                               ),
        //                               Spacer(),
        //                               Column(
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.center,
        //                                 children: <Widget>[
        //                                   Container(
        //                                     decoration: BoxDecoration(
        //                                       shape: BoxShape.circle,
        //                                       color: kprimary,
        //                                     ),
        //                                     child: Padding(
        //                                       padding: const EdgeInsets.all(8.0),
        //                                       child: Center(
        //                                         child: Text(
        //                                           '1',
        //                                           style: GoogleFonts.inter(
        //                                               fontSize: 9,
        //                                               fontWeight: FontWeight.w700,
        //                                               color: white),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   Text(
        //                                     '5:45 PM',
        //                                     style: GoogleFonts.inter(
        //                                         fontSize: 11,
        //                                         fontWeight: FontWeight.w300,
        //                                         color: grey),
        //                                   ),
        //                                 ],
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                         Divider(
        //                           color: grey,
        //                           height: 20,
        //                         )
        //                       ],
        //                     );
        //                   },
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        //
        );
  }
}

class ColoredCircleText extends StatelessWidget {
  final String text;
  final Color circleColor;
  final Color textColor;

  const ColoredCircleText({
    required this.text,
    required this.circleColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
