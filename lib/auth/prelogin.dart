import 'package:ars_dialog/ars_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:panoptesan_alpha/Helper/Colors.dart';
import 'package:panoptesan_alpha/Helper/golbal.dart';
import 'package:panoptesan_alpha/auth/LoginSignup.dart';
import 'package:panoptesan_alpha/auth/NewLoginScreen.dart';
import 'package:panoptesan_alpha/auth/newSignup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/snackbar.dart';

class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({super.key});

  @override
  State<PreLoginScreen> createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreLoginScreen> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/authbackground.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(builder: (context, BoxConstraints box) {
          return Padding(
            padding: horizontal40Padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                230.verticalSpace,
                Text('Pre Login', style: semibold32white_inter),
                15.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Get.to(() => NewSignupScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login below or',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'create an account',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: white,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      30.verticalSpace,
                    ],
                  ),
                ),
                30.verticalSpace,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      signUp = false;
                    });
                    Get.to(() => NewLoginScreen());
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        100.horizontalSpace,
                        Text(
                          'Login with',
                          style: GoogleFonts.inter(
                            fontSize: box.maxWidth * 0.045,
                            color: kprimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        5.horizontalSpace,
                        Text(
                          'Email',
                          style: GoogleFonts.inter(
                            fontSize: box.maxWidth * 0.045,
                            color: kprimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                15.verticalSpace,
                GestureDetector(
                  onTap: () async {
                    ProgressDialog progressDialog = ProgressDialog(context,
                        message: const Text("Please Wait....."),
                        title: const Text("Loading"));

                    progressDialog.show();

                    try {
                      var user = await signInWithGoogle();
                      if (user == null) {
                        throw ('Cannot sign in');
                      }
                      progressDialog.dismiss();
                    } catch (e) {
                      progressDialog.dismiss();
                      SnackbarWidget().showsnackbar(e.toString(), context);
                    }
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        65.horizontalSpace,
                        SvgPicture.asset('assets/fb.svg'),
                        15.horizontalSpace,
                        Text(
                          'Login with',
                          style: GoogleFonts.inter(
                            fontSize: box.maxWidth * 0.045,
                            color: kprimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        5.horizontalSpace,
                        Text(
                          'Facebook',
                          style: GoogleFonts.inter(
                            fontSize: box.maxWidth * 0.045,
                            color: kprimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                15.verticalSpace,
                GestureDetector(
                  onTap: () async {
                    final GoogleSignIn googleSignIn = GoogleSignIn(
                      scopes: [
                        'email',
                        'https://www.googleapis.com/auth/contacts.readonly',
                      ],
                    );

                    ProgressDialog progressDialog = ProgressDialog(context,
                        message: const Text("Please Wait....."),
                        title: const Text("Loading"));
                    final GoogleSignInAccount? googleSignInAccount =
                        await googleSignIn.signIn();
                    progressDialog.show();

                    try {
                      final GoogleSignInAuthentication
                          googleSignInAuthentication =
                          await googleSignInAccount!.authentication;

                      var email = googleSignInAccount.email;
                      String token = googleSignInAuthentication.idToken!;
                      //  var tkn = await socialAuth("google", token, email);
                      //  SharedPreferences pref = await SharedPreferences.getInstance();
                      // await pref.setString('loginToken', token);
                      // await pref.setString('token', tkn);
                      progressDialog.dismiss();
                      // reinvokecontrollers();
                      // await Navigator.pushAndRemoveUntil(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const LandingPage();
                      // }), (route) => false);
                      SnackbarWidget().showsnackbar(email.toString(), context);
                    } catch (e) {
                      progressDialog.dismiss();
                      SnackbarWidget().showsnackbar(e.toString(), context);
                      // Fluttertoast.showToast(
                      //     msg: e.toString(),
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.CENTER,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                    }
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        65.horizontalSpace,
                        SvgPicture.asset('assets/g.svg'),
                        15.horizontalSpace,
                        Text(
                          'Login with',
                          style: GoogleFonts.inter(
                            fontSize: box.maxWidth * 0.045,
                            color: kprimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        5.horizontalSpace,
                        Text(
                          'Google',
                          style: GoogleFonts.inter(
                            fontSize: box.maxWidth * 0.045,
                            color: kprimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                15.verticalSpace,
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      65.horizontalSpace,
                      SvgPicture.asset('assets/a.svg'),
                      15.horizontalSpace,
                      Text(
                        'Login with',
                        style: GoogleFonts.inter(
                          fontSize: box.maxWidth * 0.045,
                          color: kprimary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        'Apple',
                        style: GoogleFonts.inter(
                          fontSize: box.maxWidth * 0.045,
                          color: kprimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
