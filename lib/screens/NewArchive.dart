import 'dart:io';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../helpers/alerts.dart';
import '../helpers/dialog/src/progress_dialog.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panoptesan_alpha/screens/videos.dart';
import 'package:share/share.dart';

import '../controllers/videoController.dart';
import '../helpers/Colors.dart';
import '../helpers/snackbar.dart';
import '../widgets/HomeVideoCard.dart';
import '../widgets/SquareIconButton.dart';
import 'Archive.dart';

import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart' as pl;

class GradientTextPlaceholder extends StatelessWidget {
  final String text;
  final DateTime date;

  GradientTextPlaceholder({required this.text, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF33A1DE), Color(0xFF3378C4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(8),
              child: Text(
                text + ": " + _formatDate(date),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }
}

class NewArchive extends StatefulWidget {
  NewArchive({Key? key}) : super(key: key);

  @override
  State<NewArchive> createState() => _NewArchiveState();
}

class _NewArchiveState extends State<NewArchive> with TickerProviderStateMixin {
  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime.now();

  var videocontroller = Get.put(VideoController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Color(0xFFE8F1FE),
        appBar: AppBar(
          bottom: PreferredSize(
              child: Container(
                  //color: Colors.white,
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GradientTextPlaceholder(
                              text: "Videos from",
                              date: this.startDate,
                            ),
                            GradientTextPlaceholder(
                              text: "Videos to",
                              date: this.endDate,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SquareIconButton(
                              squareSize: constraints.maxWidth * 0.1,
                              onPressed: () {
                                showCustomDateRangePicker(
                                  context,
                                  dismissible: true,
                                  minimumDate: DateTime.now()
                                      .subtract(const Duration(days: 30)),
                                  maximumDate: DateTime.now()
                                      .add(const Duration(days: 30)),
                                  endDate: endDate,
                                  startDate: startDate,
                                  backgroundColor: Colors.white,
                                  primaryColor: kprimary,
                                  onApplyClick: (start, end) async {
                                    await videocontroller.getvideowithfilter(
                                        this.startDate.toString(),
                                        this.endDate.toString());

                                    setState(() {
                                      endDate = end;
                                      startDate = start;
                                    });
                                  },
                                  onCancelClick: () {},
                                );
                              },
                              icon: Icons.date_range,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
              preferredSize: Size.fromHeight(100)),
          centerTitle: true,
          title: Text(
            "Archive",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Color(0xFFE8F1FE),
        ),
        body: GetBuilder<VideoController>(builder: (_) {
          return _.videoscreenloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .91,
                            crossAxisSpacing: 2,
                            //   mainAxisSpacing: 8,
                          ),
                          padding: EdgeInsets.zero,
                          //  reverse: true,
                          itemCount: _.videos!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                print('tapped');
                                ProgressDialog progressDialog = ProgressDialog(
                                    context,
                                    message: const Text("Please Wait....."),
                                    title: const Text("Loading"));

                                progressDialog.show();
                                try {
                                  _.getVideo(_.videos![index].path.toString());
                                  progressDialog.dismiss();
                                  await Get.to(() => VideoScreen(
                                        id: _.videos![index].id.toString(),
                                      ));
                                } catch (e) {
                                  SnackbarWidget()
                                      .showsnackbar(e.toString(), context);
                                  progressDialog.dismiss();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: HomeVideoCard(
                                    midbutton: () async {
                                      print('tapped');
                                      ProgressDialog progressDialog =
                                          ProgressDialog(context,
                                              message: const Text(
                                                  "Please Wait....."),
                                              title: const Text("Loading"));

                                      progressDialog.show();
                                      try {
                                        _.getVideo(
                                            _.videos![index].path.toString());
                                        progressDialog.dismiss();
                                        await Get.to(() => VideoScreen(
                                              id: _.videos![index].id
                                                  .toString(),
                                            ));
                                      } catch (e) {
                                        SnackbarWidget().showsnackbar(
                                            e.toString(), context);
                                        progressDialog.dismiss();
                                      }
                                    },
                                    archivevisible: false,
                                    download: () async {
                                      print("tapped download");
                                      var pr = pl.ProgressDialog(context,
                                          type: pl.ProgressDialogType.download,
                                          isDismissible: true,
                                          showLogs: true);
                                      pr.style(
                                          message: 'Downloading file...',
                                          borderRadius: 10.0,
                                          backgroundColor: Colors.white,
                                          progressWidget:
                                              CircularProgressIndicator(),
                                          elevation: 10.0,
                                          insetAnimCurve: Curves.easeInOut,
                                          progress: 0.0,
                                          maxProgress: 100.0,
                                          progressTextStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400),
                                          messageTextStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.w600));

                                      print(_.videos![index].path.toString());
                                      var url =
                                          _.videos![index].path.toString();
                                      var dio = new Dio();

                                      await pr.show();
                                      try {
                                        var status =
                                            await Permission.storage.status;
                                        if (!status.isGranted) {
                                          await Permission.storage.request();
                                        }
                                        String path = "";
                                        Directory? extDir;

                                        if (Platform.isIOS) {
                                          extDir =
                                              await getDownloadsDirectory();
                                        }

                                        if (Platform.isAndroid) {
                                          path = await await ExternalPath
                                              .getExternalStoragePublicDirectory(
                                                  ExternalPath
                                                      .DIRECTORY_DOWNLOADS);
                                        }

                                        final testDir = await Directory(
                                                '${path}/panoptesan')
                                            .create(recursive: true);
                                        final String fileExtension = 'mp4';
                                        final String filePath =
                                            '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
                                        await dio.download(url, filePath,
                                            onReceiveProgress: (d, d1) {
                                          print(d.toString() +
                                              " " +
                                              d1.toString());

                                          double percentage = (d / d1) * 100;

                                          int item = percentage.toInt();

                                          percentage = item.toDouble();

                                          pr.update(progress: percentage);
                                        });

                                        await pr.hide();
                                        var vd = filePath.split("/").last;
                                        return Alert().showalertwithmessage(
                                            "Video has been downloaded as $filePath",
                                            context);
                                      } catch (e) {
                                        print(e);
                                        var result = await pr.hide();

                                        return Alert().showalertwithmessage(
                                            "Failed to Download file", context);
                                      }
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
                                      await Share.share(
                                          _.videos![index].path.toString());
                                    },
                                    videodate: _.videos == null
                                        ? ""
                                        : '${_.videos?[index].createdAt?.month}/${_.videos?[index].createdAt?.day}/${_.videos?[index].createdAt?.year}',
                                    thumpnail: _.videos == null
                                        ? ''
                                        : _.videos?[index].thumbnail.toString(),
                                    videolink: _.videos == null
                                        ? ''
                                        : _.videos?[index].path.toString()),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                );
        }),
      );
    });
  }
}
