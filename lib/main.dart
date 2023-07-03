import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:panoptesan_alpha/screens/NewLoginScreen.dart';
import 'package:panoptesan_alpha/screens/get_started.dart';
import 'package:panoptesan_alpha/screens/homemain.dart';

import 'firebase_options.dart';
import 'handlers/LoginSignupHandler.dart';
import 'helpers/localstorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(
  //     debug:
  //         true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        await Get.offAll(Getstarted());
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
