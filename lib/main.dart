import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:panoptesan_alpha/auth/prelogin.dart';
import 'package:panoptesan_alpha/editVideo.dart';
import 'package:panoptesan_alpha/mainFolder/homemain.dart';
import 'package:panoptesan_alpha/screens/Notifications.dart';
import 'package:panoptesan_alpha/screens/Profile.dart';
import 'package:panoptesan_alpha/screens/StartRecording.dart';
import 'package:panoptesan_alpha/screens/editProfile.dart';
import 'package:panoptesan_alpha/screens/subscriotion.dart';
import 'package:panoptesan_alpha/videos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 925),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Splash(),
        );
      },
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({
    super.key,
  });

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Get.to(() => PreLoginScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.sh,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/splash.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 64.h),
              Container(
                height: 290,
                width: 290,
                child: Center(child: Image.asset('assets/logo.png')),
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
