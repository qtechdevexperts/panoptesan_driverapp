import 'package:flutter/material.dart';
import 'package:panoptesan_alpha/controllers/profilecontroller.dart';
import 'package:panoptesan_alpha/screens/editProfile.dart';
import 'package:get/get.dart';
import '../widgets/HomeVideoCard.dart';

class NewProfile extends StatefulWidget {
  NewProfile({Key? key}) : super(key: key);

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  var controller = Get.put(ProfileController());
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
                      top: 20,
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          var controller = Get.put(ProfileController());

                          await controller.callgetprofile(context, () {
                            Get.to(() => EditProfileScreen());
                          });
                          // Button action goes here
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
                    Positioned(
                      top: 130,
                      child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  controller.profile?.userDetail?.profileImg ??
                                      ''),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Text(
                controller.profile?.userDetail?.name ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                controller.profile?.userDetail?.address ?? '',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: constraint.maxWidth / 1.2,
                child: ElevatedButton(
                  onPressed: () {
                    // Button action goes here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    primary: Colors.blue,
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
              const SizedBox(
                height: 15,
              ),
              // const Text(
              //   'Fleet Manager',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Container(
              //     width: 120,
              //     height: 120,
              //     decoration: BoxDecoration(
              //       image: const DecorationImage(
              //         image: AssetImage('assets/p5.jpg'),
              //         fit: BoxFit.cover,
              //       ),
              //       shape: BoxShape.circle,
              //       color: Colors.black,
              //       border: Border.all(
              //         color: Colors.white,
              //         width: 2,
              //       ),
              //     )),
              // const SizedBox(
              //   height: 15,
              // ),
              // const Text(
              //   'Will Smith',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Text(
              //   'Will Smith',
              //   style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   width: constraint.maxWidth / 1.2,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // Button action goes here
              //     },
              //     style: ElevatedButton.styleFrom(
              //       padding: const EdgeInsets.symmetric(horizontal: 20),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25),
              //       ),
              //       primary: Colors.blue,
              //     ),
              //     child: const Text(
              //       'Leave Fleet',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 16,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 15,
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
              // GridView.builder(
              //     shrinkWrap: true,
              //     physics: const ScrollPhysics(),
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       childAspectRatio: .91,
              //       crossAxisSpacing: 2,
              //       //   mainAxisSpacing: 8,
              //     ),
              //     padding: EdgeInsets.zero,
              //     itemCount: 8,
              //     itemBuilder: (BuildContext context, int index) {
              //       return const Padding(
              //         padding: EdgeInsets.all(10.0),
              //         child: HomeVideoCard(),
              //       );
              //     }),
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
