import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/constants.dart';
import 'package:panoptesan_alpha/controllers/profilecontroller.dart';
import 'package:panoptesan_alpha/controllers/videoController.dart';
import 'package:panoptesan_alpha/helpers/Colors.dart';
import 'package:panoptesan_alpha/screens/editProfile.dart';
import 'package:get/get.dart';
import 'package:panoptesan_alpha/screens/subscriotion.dart';
import 'package:panoptesan_alpha/screens/videos.dart';
import 'package:share/share.dart';
import '../helpers/alerts.dart';
import '../helpers/api-constants.dart';
import '../helpers/dialog/src/progress_dialog.dart';
import '../helpers/snackbar.dart';
import '../widgets/HomeVideoCard.dart';
import '../widgets/ProfileWidget.dart';

class NewProfile extends StatefulWidget {
  NewProfile({Key? key}) : super(key: key);

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  var controller = Get.put(ProfileController());

  //var _ = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: constraint.maxHeight / 2.5,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                        child: Image.asset(
                      'assets/b3.png',
                      fit: BoxFit.fill,
                      height: 200,
                      width: double.infinity,
                    )),
                    const Positioned(
                      top: 50,
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 0,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          var controller = Get.put(ProfileController());

                          await controller.callgetprofile(context);
                          await Get.to(() => EditProfileScreen());
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        ),
                        label: const Text(''),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                    ),
                    GetBuilder<ProfileController>(
                      builder: (_) {
                        return Positioned(
                          top: 130,
                          child: CachedNetworkImage(
                              imageUrl: _.profile?.userDetail?.profileImg ?? "",
                              imageBuilder: (context, imageProvider) => Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      width: constraint.maxWidth * 0.28,
                                      height: constraint.maxHeight * 0.2,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      width: constraint.maxWidth * 0.28,
                                      height: constraint.maxHeight * 0.2,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://firebasestorage.googleapis.com/v0/b/panoptesan-c6ef1.appspot.com/o/pngaaa.com-2189569.png?alt=media&token=ce959fd9-31c8-4c9e-bcbd-c277ad48311e"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  )),

                          // child: FastCachedImage(
                          //   url: _.profile?.userDetail?.profileImg ?? "",
                          //   fit: BoxFit.cover,
                          //   fadeInDuration: const Duration(seconds: 1),
                          //   errorBuilder: (context, exception, stacktrace) {
                          //     return Text(stacktrace.toString());
                          //   },
                          //   loadingBuilder: (context, progress) {
                          //     return Container(
                          //     //  color: Colors.yellow,
                          //       child: Stack(
                          //         alignment: Alignment.center,
                          //         children: [
                          //           if (progress.isDownloading &&
                          //               progress.totalBytes != null)
                          //             Text(
                          //                 '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                          //                 style: const TextStyle(
                          //                     color: Colors.red)),
                          //           SizedBox(
                          //               width: 120,
                          //               height: 120,
                          //               child: CircularProgressIndicator(
                          //                   color: Colors.red,
                          //                   value: progress
                          //                       .progressPercentage.value)),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // ),
                          // //   child: FastCachedImage(url:  _.profile?.userDetail?.profileImg??""),
                          // child: Container(
                          //     width: constraint.maxWidth * 0.5,
                          //     height: constraint.maxHeight * 0.18,
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //         image: NetworkImage(
                          //             _.profile?.userDetail?.profileImg ??
                          //                 ''),
                          //         fit: BoxFit.cover,
                          //       ),
                          //       shape: BoxShape.circle,
                          //       color: Colors.black,
                          //       border: Border.all(
                          //         color: Colors.white,
                          //         width: 2,
                          //       ),
                          //     )),
                        );
                      },
                    )
                  ],
                ),
              ),
              Text(
                controller.profile?.userDetail?.name ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: constraint.maxWidth * 0.05),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                controller.profile?.userDetail?.address ?? '',
                style: TextStyle(
                    fontSize: constraint.maxWidth * 0.035,
                    color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: constraint.maxWidth / 1.2,
                child: ElevatedButton(
                  onPressed: () async {
                    ProgressDialog progressDialog = ProgressDialog(context,
                        message: const Text("Please Wait....."),
                        title: const Text("Loading"));
                    progressDialog.show();

                    try {
                      if (controller.packages.isEmpty) {
                        await controller.getpackages();
                      }
                      progressDialog.dismiss();
                      await Get.to(() => SubscriptionScreen());
                    } catch (e) {
                      progressDialog.dismiss();

                      Alert().showalertwithmessage(e.toString(), context);
                    }

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
                    'Buy Storage Pack',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              GetBuilder<ProfileController>(builder: (_) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    controller.profile?.fleetUser == null
                        ? Container()
                        : Text(
                            "Fleet Manager",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: constraint.maxHeight * 0.035),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    controller.profile?.fleetUser == null
                        ? Container()
                        : Container(
                            width: constraint.maxWidth * 0.5,
                            height: constraint.maxHeight * 0.18,
                            child: CachedNetworkImage(
                                imageUrl: controller.profile?.fleetUser != null
                                    ? controller.profile!.fleetUser!.userDetail
                                        .profileImg
                                        .toString()
                                    : "",
                                imageBuilder: (context, imageProvider) =>
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        width: constraint.maxWidth * 0.28,
                                        height: constraint.maxHeight * 0.2,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        width: constraint.maxWidth * 0.28,
                                        height: constraint.maxHeight * 0.2,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://firebasestorage.googleapis.com/v0/b/panoptesan-c6ef1.appspot.com/o/pngaaa.com-2189569.png?alt=media&token=ce959fd9-31c8-4c9e-bcbd-c277ad48311e"),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    )),
                          ),

                    // Container(
                    //     width: constraint.maxWidth * 0.5,
                    //     height: constraint.maxHeight * 0.18,
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: NetworkImage(
                    //             controller.profile?.fleetUser == null
                    //                 ? controller.profile!.fleetUser!
                    //                     .userDetail.profileImg
                    //                     .toString()
                    //                 : ""),
                    //         fit: BoxFit.cover,
                    //       ),
                    //       shape: BoxShape.circle,
                    //       color: Colors.black,
                    //       border: Border.all(
                    //         color: Colors.white,
                    //         width: 2,
                    //       ),
                    //     )),
                    const SizedBox(
                      height: 15,
                    ),
                    controller.profile?.fleetUser == null
                        ? Container()
                        : Text(
                            controller.profile!.fleetUser!.userDetail.name
                                .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: constraint.maxWidth * 0.05),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    controller.profile?.fleetUser == null
                        ? Container()
                        : Text(
                            controller.profile!.fleetUser!.username.toString(),
                            style: TextStyle(
                                fontSize: constraint.maxWidth * 0.035,
                                color: Colors.grey[600]),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    controller.profile?.fleetUser == null
                        ? Container()
                        : Container(
                            width: constraint.maxWidth / 1.2,
                            child: ElevatedButton(
                              onPressed: () async {
                                ProgressDialog progressDialog = ProgressDialog(
                                    context,
                                    message: const Text("Please Wait....."),
                                    title: const Text("Loading"));

                                progressDialog.show();
                                try {
                                  await controller.leavefleet();
                                  progressDialog.dismiss();
                                  Alert().showalertwithmessage(
                                      "Leave fleet successful", context);
                                } catch (e) {
                                  SnackbarWidget()
                                      .showsnackbar(e.toString(), context);
                                  progressDialog.dismiss();
                                }

                                // Button action goes here
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                primary: kprimary,
                              ),
                              child: const Text(
                                'Leave Fleet',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                );
              }),
              Text(
                "Videos",
                style: TextStyle(
                    color: Colors.blue, fontSize: constraint.maxWidth * 0.06),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  height: 2,
                  width: constraint.maxWidth / 1.2,
                  child: const Divider(
                    color: Colors.blue,
                    thickness: 2,
                  ),
                ),
              ),
               GetBuilder<VideoController>(
                builder: (_v) {
                  return Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .99,
                          crossAxisSpacing: 2,
                          //   mainAxisSpacing: 8,
                        ),
                        padding: EdgeInsets.zero,
                        itemCount: _v.videos!.length,
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
                                _v.getVideo(_v.videos![index].path.toString());
                                progressDialog.dismiss();
                                await Get.to(() => VideoScreen(
                                      id: _v.videos![index].id.toString(),
                                    ));
                              } catch (e) {
                                SnackbarWidget()
                                    .showsnackbar(e.toString(), context);
                                progressDialog.dismiss();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ProfileHomeWidget(
                                videodate:
                                    '${_v.videos?[index].createdAt?.month}/${_v.videos?[index].createdAt?.day}/${_v.videos?[index].createdAt?.year}',
                                thumpnail: _v.videos == null
                                    ? ""
                                    : _v.videos?[index].thumbnail.toString() ?? "",
                                videolink: _v.videos == null
                                    ? ""
                                    : _v.videos?[index].path.toString(),
                                archive: () {},
                                download: () {},
                                share: () async {
                                  await Share.share(
                                      _v.videos![index].path.toString());
                                },
                              ),
                            ),
                          );
                        }),
                  );
                }
              ),
              SizedBox(
                height: constraint.maxHeight / 2,
              ),
            ],
          ),
        ),
      );
    });
  }
}
