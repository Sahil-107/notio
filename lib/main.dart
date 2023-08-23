import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notio/Navbar.dart';
import 'package:notio/Objects/curUser.dart';
import 'package:notio/Screens/Auth/ForgotPassword/EnterOTP.dart';
import 'package:notio/Screens/Auth/ForgotPassword/ResetPassword1.dart';
import 'package:notio/Screens/Auth/ForgotPassword/ResetPassword2.dart';
import 'package:notio/Screens/Auth/Loading.dart';
import 'package:notio/Screens/Auth/Onboarding.dart';
import 'package:notio/Screens/Auth/Otp.dart';
import 'package:notio/Screens/Creator/CreatorMenu.dart';
import 'package:notio/Screens/Creator/NewContribution.dart';
import 'package:notio/Screens/Creator/Revenue.dart';
import 'package:notio/Screens/Creator/newPost.dart';
import 'package:notio/Screens/Notifications.dart';
import 'package:notio/Screens/QuestionpaperModule/questionPaperMainScreen.dart';
import 'package:notio/Screens/Verification/underVerificationPage.dart';
import 'package:notio/Screens/Verification/verificationDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Auth/Login.dart';
import 'Screens/Creator/CreatorProfile.dart';
import 'Screens/Creator/Wallet.dart';
import 'Screens/Home.dart';
import 'Screens/Others/Others_profile.dart';
import 'Screens/Saved.dart';
import 'Screens/Subject.dart';

void main() {
  runApp(MyApp());
}

//gloabls

curUser currentUser = curUser();
late final SharedPreferences prefs;

class MyApp extends StatelessWidget {
  // MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Notio",
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFF4F7FF),
          fontFamily: "Avenir",
        ),
        routes: {
          '/login': (context) => const Login(),
          '/onboarding': (context) => Onboarding(),
          '/loading': (context) => const Loading(),
          '/home': (context) => Home(),
          '/subjects': (context) => Subject(),
          '/saved': (context) => Saved(),
          '/navbar': (context) => Navbar(),
          '/verificationDetails': (context) => Verification(),
          '/verification2': (context) => creatorUnderVerification(),
          '/creatorProfile': (context) => CreatorProfile(),
          // '/creatorMenu': (context) => CreatorMenu(),
          // '/newContribution': (context) => NewContribution(),
          '/revenue': (context) => Revenue(),
          '/testing': (context) => newPost(),
          '/otp': (context) => OTP(),
          '/enterOtp': (context) => EnterOTP(),
          '/resetPassword1': (context) => ResetPassword1(),
          '/resetPassword2': (context) => ResetPassword2(),
          '/notifications': (context) => Notifications(),
          '/wallet': (context) => Wallet(),
          '/othersProfile': (context) => Others_profile(),
          '/questionPaperModule': (context) => QuestionPaperMainScreen(),
        },
        initialRoute: '/loading');
  }
}

//////////// this is for testing