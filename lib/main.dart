import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:panoptesan_alpha/auth/prelogin.dart';
import 'package:panoptesan_alpha/editVideo.dart';
import 'package:panoptesan_alpha/helper/localstorage.dart';
import 'package:panoptesan_alpha/mainFolder/homemain.dart';
import 'package:panoptesan_alpha/screens/Notifications.dart';
import 'package:panoptesan_alpha/screens/Profile.dart';
import 'package:panoptesan_alpha/screens/StartRecording.dart';
import 'package:panoptesan_alpha/screens/editProfile.dart';
import 'package:panoptesan_alpha/screens/subscriotion.dart';
import 'package:panoptesan_alpha/videos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.init();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, checkuser);
  }

  checkuser() async {
    String? token;
    token = LocalStorage.prefs?.getString('token');

    Timer(
      Duration(seconds: 2),
      () {},
    );
    try {
      if (token == null || token.isEmpty) {
        //    Get.to(() => PreLoginScreen());
        await Get.offAll(PreLoginScreen());
        // Route route = MaterialPageRoute(builder: (context) => PreLoginScreen());
        //  Navigator.pushReplacement(context, route);
      } else {
        await Get.offAll(MainScreen());

        //  Route route = MaterialPageRoute(builder: (context) => PreLoginScreen());
        //  Navigator.pushReplacement(context, route);
      }
    } catch (e) {
      await Get.offAll(MainScreen());
      //  Route route = MaterialPageRoute(builder: (context) => PreLoginScreen());
      //  Navigator.pushReplacement(context, route);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
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
