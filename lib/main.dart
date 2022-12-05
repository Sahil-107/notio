import 'package:flutter/material.dart';
import 'package:notio/Navbar.dart';
import 'package:notio/Screens/Auth/Loading.dart';
import 'package:notio/Screens/Auth/Onboarding.dart';
import 'package:notio/Screens/Verification/Verfication2.dart';
import 'package:notio/Screens/Verification/VerificationDetails.dart';
import 'Screens/Auth/Login.dart';
import 'Screens/Home.dart';
import 'Screens/Saved.dart';
import 'Screens/Subject.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Notio",
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFE5E5E5),
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
          '/verification2': (context) => Verification2()
        },
        initialRoute: '/loading');
  }
}
