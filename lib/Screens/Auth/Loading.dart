import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notio/Screens/Auth/Login.dart';
import 'package:notio/apiServices/authServices.dart';
import 'package:notio/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  authServices _authservices = authServices();

  @override
  void initState() {
    loadUser();
    super.initState();
  }

  loadUser() async {
    prefs = await SharedPreferences.getInstance();
    print(prefs.get("UID"));
    if (prefs.get("UID") != null) {
      try {
          var _token = await _authservices.generateToken("notio_cc");
      var _data = await _authservices
          .getUserData({"token": _token.body, "id": prefs.get("UID")});
      print(jsonDecode(_data.body)["Response"]);
      await putData(jsonDecode(_data.body)["Response"]);
      Navigator.pushReplacementNamed(context, '/navbar');
      } catch (e) {
        Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Login())));
      }
    
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Login())));
    }
  }

  putData(_data) {
    currentUser.setemail(_data["email"]);
    currentUser.setphone(_data["phone"].toString());
    currentUser.setusername(_data["username"]);
    currentUser.setname(_data["name"]);
    currentUser.setuid(_data["id"]);
    currentUser.setbranch(_data["branch"]);
    currentUser.setuniversity(_data["university"]);
    currentUser.setcollege(_data["college"]);
    currentUser.setgender(_data["gender"]);
    currentUser.setsem(_data["sem"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: getheight(context, 150),
            ),
            Image(
              image: AssetImage('images/logo.png'),
              height: getheight(context, 250),
              width: getwidth(context, 250),
            ),
            SizedBox(
              height: getheight(context, 250),
            ),
            SpinKitFadingCircle(
              color: Colors.blue,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
