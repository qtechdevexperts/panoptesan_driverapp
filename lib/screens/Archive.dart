import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/Widgets/calendar.dart';
import 'package:panoptesan_alpha/controller/videoController.dart';
import 'package:panoptesan_alpha/videos.dart';
import 'package:intl/intl.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  bool isreload = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leadingWidth: 70,
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
          'Archive',
          style: appbarstyle,
        ),
      ),
      body: Padding(
        padding: horizontal20Padding,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              30.verticalSpace,
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isreload = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/reload.svg',
                              color: isreload == true
                                  ? kprimary
                                  : Color(0xff667080).withOpacity(0.5),
                            ),
                            20.verticalSpace,
                            Container(
                              height: 1,
                              color: isreload == true
                                  ? kprimary
                                  : Color(0xff667080).withOpacity(0.5),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isreload = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/Icon awesome-calendar-day.png',
                              color: isreload == false
                                  ? kprimary
                                  : Color(0xff667080).withOpacity(0.5),
                            ),
                            19.verticalSpace,
                            Container(
                              height: 1,
                              color: isreload == false
                                  ? kprimary
                                  : Color(0xff667080).withOpacity(0.5),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              isreload == true
                  ? Container(
                      width: 1.sw,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.95,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () async {
                              ProgressDialog progressDialog = ProgressDialog(
                                  context,
                                  message: const Text("Please Wait....."),
                                  title: const Text("Loading"));

                              progressDialog.show();
                              try {
                                var controller = Get.put(VideoController());
                                await controller.getVideo();
                                progressDialog.dismiss();
                                await Get.to(() => VideoScreen());
                              } catch (e) {
                                progressDialog.dismiss();
                              }
                            },
                            child: Container(
                              height: 190,
                              width: 190,
                              decoration: BoxDecoration(
                                color: reddishColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(roadpics[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        SvgPicture.asset('assets/share.svg'),
                                      ],
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/videocam.svg',
                                          height: 12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '11/15/2022',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 14,
                                          color: white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      width: 1.sw,
                      height: 0.7.sh,
                      // color: black,
                      child: Custom(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class Custom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PagedVerticalCalendar(
      onDayPressed: (value) {
        Get.to(() => VideoScreen());
      },
      initialDate: DateTime.now(),

      /// customize the month header look by adding a week indicator
      monthBuilder: (context, month, year) {
        return Column(
          children: [
            /// create a customized header displaying the month and year
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                // color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Text(DateFormat('MMMM yyyy').format(DateTime(year, month)),
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: black,
                  )
                  // Theme.of(context).textTheme.bodyText1!.copyWith(
                  //       color: Colors.black,
                  //     ),
                  ),
            ),

            /// add a row showing the weekdays
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  weekText('M'),
                  weekText('T'),
                  weekText('W'),
                  weekText('T'),
                  weekText('F'),
                  weekText('S'),
                  weekText('S'),
                ],
              ),
            ),
          ],
        );
      },
      // how to create a rectangular message container with nib

      /// added a line between every week
      dayBuilder: (context, date) {
        return Container(
          decoration: BoxDecoration(color: white),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF1F2F6),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(DateFormat('dd').format(date)),
                  ),
                ),
              ),
              // const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget weekText(String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: TextStyle(
            color: kprimary, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
