import 'dart:isolate';
import 'dart:ui';

import '../helpers/dialog/src/progress_dialog.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/helpers/Colors.dart';
import 'package:panoptesan_alpha/helpers/snackbar.dart';
import 'package:panoptesan_alpha/screens/SOSMessageScreen.dart';
import 'package:panoptesan_alpha/screens/videos.dart';
import 'package:share/share.dart';

import '../controllers/BottomController.dart';
import '../controllers/videoController.dart';
import '../widgets/HomeVideoCard.dart';
import 'Settings.dart';

// class DownloadClass {
//   static void downloadCallback(
//       String id, DownloadTaskStatus status, int progress) {
//     if (kDebugMode) {
//       print(
//           'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
//     }
//     final SendPort send =
//         IsolateNameServer.lookupPortByName('downloader_send_port')!;
//     send.send([id, status, progress]);
//   }
// }

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const CircleIconButton(
      {required this.icon,
      required this.backgroundColor,
      required this.iconColor,
      required this.onPressed,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width == null ? 35 : width,
        height: height == null ? 35 : height,
        decoration: BoxDecoration(
          color: this.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          this.icon,
          color: this.iconColor,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var videocontroller = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            Get.to(() => SOSMessageScreen());
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 120, right: 20),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/panic.svg'),
              ),
              height: 56.h,
              width: 150.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffF1F2F6),
      appBar: AppBar(
        bottom: PreferredSize(
            child: Container(
                //color: Colors.white,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: const Text(
                        "Recent Videos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ))),
            preferredSize: Size.fromHeight(kToolbarHeight)),

        automaticallyImplyLeading: false,
        // leading: CircleIconButton(
        //   backgroundColor: Colors.blue,
        //   icon: Icons.settings,
        //   iconColor: Colors.white,
        //   onPressed: () {
        //     //   Get.back();
        //   },
        // ),
        leadingWidth: 60,
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
          'Home',
          style: appbarstyle,
        ),
        actions: [
          CircleIconButton(
            backgroundColor: Colors.blue,
            icon: Icons.settings,
            iconColor: Colors.white,
            onPressed: () {
              Get.to(() => SettingsScreen());
            },
          ),
          // GestureDetector(
          //   onTap: () => Get.to(() => SettingsScreen()),
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20, bottom: 10),
          //     child: Container(
          //       width: 55,
          //       height: 50,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(5), color: white),
          //       child: Padding(
          //         padding: const EdgeInsets.all(12),
          //         child: SvgPicture.asset(
          //           'assets/setting.svg',
          //           color: Color(0xff005D99),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          20.horizontalSpace,
        ],
      ),

      body: GetBuilder<VideoController>(builder: (_) {
        return GridView.builder(

            // shrinkWrap: true,
            //physics: ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .91,
              crossAxisSpacing: 2,
              //   mainAxisSpacing: 8,
            ),
            padding: EdgeInsets.zero,
            //  reverse: true,
            itemCount: _.videos?.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () async {
                  print('tapped');
                  ProgressDialog progressDialog = ProgressDialog(context,
                      message: const Text("Please Wait....."),
                      title: const Text("Loading"));

                  progressDialog.show();
                  try {
                    _.getVideo(_.videos![index].path.toString());
                    progressDialog.dismiss();
                    await Get.to(() => VideoScreen());
                  } catch (e) {
                    SnackbarWidget().showsnackbar(e.toString(), context);
                    progressDialog.dismiss();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: HomeVideoCard(
                      download: () async {
//                         var path = await ExternalPath
//                             .getExternalStoragePublicDirectory(
//                                 ExternalPath.DIRECTORY_DOWNLOADS);
//                         final taskId = await FlutterDownloader.enqueue(
//                           saveInPublicStorage: true,
//                           url: _.videos![index].path.toString(),
//                           headers: {}, // optional: header send with url (auth token etc)
//                           savedDir: path,
//                           showNotification:
//                               true, // show download progress in status bar (for Android)
//                           openFileFromNotification:
//                               true, // click on notification to open downloaded file (for Android)

//                         );

// FlutterDownloader.registerCallback(DownloadClass.downloadCallback(taskId, status, progress));
                      },
                      share: () async {
                        await Share.share(_.videos![index].path.toString());
                      },
                      videodate:
                          '${_.videos?[index].createdAt?.month}/${_.videos?[index].createdAt?.day}/${_.videos?[index].createdAt?.year}',
                      thumpnail: _.videos == null
                          ? ""
                          : _.videos?[index].thumbnail.toString() ?? "",
                      videolink: _.videos == null
                          ? ""
                          : _.videos?[index].path.toString()),
                ),
              );
            });
      }),
      // body: Padding(
      //   padding: horizontal20Padding,
      //   child: SingleChildScrollView(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         40.verticalSpace,
      //         Text(
      //           'Recent Videos',
      //           style: GoogleFonts.inter(
      //               fontSize: 28, fontWeight: FontWeight.w800, color: kprimary),
      //         ),
      //         15.verticalSpace,
      //         Container(
      //           width: 1.sw,
      //           child: GridView.builder(
      //               shrinkWrap: true,
      //               physics: NeverScrollableScrollPhysics(),
      //               gridDelegate:
      //                   const SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 childAspectRatio: .86,
      //                 crossAxisSpacing: 2,
      //                 mainAxisSpacing: 8,
      //               ),
      //               itemCount: 4,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return HomeVideoCard();

      //                 //   return GestureDetector(
      //                 //     onTap: () async {
      //                 //       ProgressDialog progressDialog = ProgressDialog(context,
      //                 //           message: const Text("Please Wait....."),
      //                 //           title: const Text("Loading"));

      //                 //       progressDialog.show();
      //                 //       try {
      //                 //         var controller = Get.put(VideoController());
      //                 //         await controller.getVideo();
      //                 //         progressDialog.dismiss();
      //                 //         await Get.to(() => VideoScreen());
      //                 //       } catch (e) {
      //                 //         progressDialog.dismiss();
      //                 //       }
      //                 //     },
      //                 //     child: Container(
      //                 //       height: 190,
      //                 //       width: 190,
      //                 //       decoration: BoxDecoration(
      //                 //         color: reddishColor,
      //                 //         borderRadius: BorderRadius.only(
      //                 //           topLeft: Radius.circular(5),
      //                 //           topRight: Radius.circular(5),
      //                 //         ),
      //                 //         image: DecorationImage(
      //                 //           image: AssetImage(roadpics[index]),
      //                 //           fit: BoxFit.cover,
      //                 //         ),
      //                 //       ),
      //                 //       child: Padding(
      //                 //         padding: const EdgeInsets.all(12),
      //                 //         child: Column(
      //                 //           mainAxisAlignment: MainAxisAlignment.end,
      //                 //           crossAxisAlignment: CrossAxisAlignment.start,
      //                 //           children: <Widget>[
      //                 //             Row(
      //                 //               mainAxisAlignment: MainAxisAlignment.end,
      //                 //               children: <Widget>[
      //                 //                 GestureDetector(
      //                 //                   onTap: () {
      //                 //                     if (bt.navigationBarIndexValue != 1) {
      //                 //                       bt.navBarChange(1);
      //                 //                     } else {
      //                 //                       Get.back();
      //                 //                     }
      //                 //                   },
      //                 //                   child: Container(
      //                 //                     child:
      //                 //                         SvgPicture.asset('assets/folder.svg'),
      //                 //                   ),
      //                 //                 ),
      //                 //                 15.horizontalSpace,
      //                 //                 SvgPicture.asset('assets/download.svg'),
      //                 //                 15.horizontalSpace,
      //                 //                 GestureDetector(
      //                 //                     onTap: () {
      //                 //                       showDialog(
      //                 //                         barrierDismissible: false,
      //                 //                         context: context,
      //                 //                         builder: (BuildContext context) {
      //                 //                           return AlertDialog(
      //                 //                             shape: RoundedRectangleBorder(
      //                 //                                 borderRadius:
      //                 //                                     BorderRadius.circular(
      //                 //                                         10)),
      //                 //                             insetPadding: horizontal40Padding,
      //                 //                             contentPadding:
      //                 //                                 EdgeInsets.symmetric(
      //                 //                                     horizontal: 20.w,
      //                 //                                     vertical: 0.h),
      //                 //                             actionsPadding: EdgeInsets.zero,
      //                 //                             content: Column(
      //                 //                               mainAxisSize: MainAxisSize.min,
      //                 //                               children: [
      //                 //                                 20.verticalSpace,
      //                 //                                 GestureDetector(
      //                 //                                   onTap: () => Get.back(),
      //                 //                                   child: Align(
      //                 //                                     alignment:
      //                 //                                         Alignment.topRight,
      //                 //                                     child: FaIcon(
      //                 //                                       FontAwesomeIcons.x,
      //                 //                                       color: Colors.red,
      //                 //                                       size: 15,
      //                 //                                     ),
      //                 //                                   ),
      //                 //                                 ),
      //                 //                                 20.verticalSpace,
      //                 //                                 Text(
      //                 //                                   "Share",
      //                 //                                   style: GoogleFonts.inter(
      //                 //                                       fontSize: 30,
      //                 //                                       fontWeight:
      //                 //                                           FontWeight.w700,
      //                 //                                       color: black),
      //                 //                                 ),
      //                 //                                 SizedBox(height: 10.h),
      //                 //                                 Row(
      //                 //                                   mainAxisAlignment:
      //                 //                                       MainAxisAlignment
      //                 //                                           .spaceBetween,
      //                 //                                   children: <Widget>[
      //                 //                                     SvgPicture.asset(
      //                 //                                         'assets/fbshare.svg'),
      //                 //                                     SvgPicture.asset(
      //                 //                                         'assets/ig.svg'),
      //                 //                                     SvgPicture.asset(
      //                 //                                         'assets/twitter.svg'),
      //                 //                                   ],
      //                 //                                 ),
      //                 //                                 25.verticalSpace,
      //                 //                               ],
      //                 //                             ),
      //                 //                           );
      //                 //                         },
      //                 //                       );
      //                 //                     },
      //                 //                     child: Container(
      //                 //                         child: SvgPicture.asset(
      //                 //                             'assets/share.svg'))),
      //                 //               ],
      //                 //             ),
      //                 //             Expanded(
      //                 //               child: Center(
      //                 //                 child:
      //                 //                     SvgPicture.asset('assets/videocam.svg'),
      //                 //               ),
      //                 //             ),
      //                 //             Text(
      //                 //               '11/15/2022',
      //                 //               style: GoogleFonts.inter(
      //                 //                   fontWeight: FontWeight.w200,
      //                 //                   fontSize: 16,
      //                 //                   color: white),
      //                 //             )
      //                 //           ],
      //                 //         ),
      //                 //       ),
      //                 //     ),
      //                 //   );
      //                 // },
      //               }),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
