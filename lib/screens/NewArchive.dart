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
import 'Archive.dart';

class NewArchive extends StatefulWidget {
  NewArchive({Key? key}) : super(key: key);

  @override
  State<NewArchive> createState() => _NewArchiveState();
}

class _NewArchiveState extends State<NewArchive> with TickerProviderStateMixin {
  late final TabController _tabController;

  var videocontroller = Get.put(VideoController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F1FE),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Archive",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Color(0xFFE8F1FE),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(
                Icons.refresh,
                color: Color(0xFF007AB6),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.calendar_month,
                color: Color(0xFF007AB6),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        GetBuilder<VideoController>(builder: (_) {
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
              });
        }),
        Container(
          width: 1.sw,
          height: 0.7.sh,
          // color: black,
          child: Custom(),
        )
      ]),
    );
  }
}
