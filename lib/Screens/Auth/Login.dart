import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:notio/apiServices/authServices.dart';
import 'package:notio/keys.dart';
import 'package:notio/main.dart';
import 'package:notio/utility.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isObscure = true;
  String _email = "";
  String _pass = "";
  String _username = "";
  String _name = "";
  String _phone = "";
  String _login_username = "";
  String _login_password = "";

  authServices _authservices = new authServices();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  loginUser() async {
    var _token = await _authservices.generateToken(key_word);
    print(_token);
    var userObject = {
      "userName": _login_username,
      "password": _login_password,
      "token": _token,
    };
    var res = await _authservices.loginUser(userObject);
    print(res.body);
    loadUser(jsonDecode(res.body)["Data"]["id"]);
  }

  loadUser(int uid) async {
    await prefs.setInt("UID", uid);
    var _token = await _authservices.generateToken(key_word);
    var _data = await _authservices.getUserData({"token": _token, "id": uid});
    print(jsonDecode(_data.body)["Response"]);
    await putData(jsonDecode(_data.body)["Response"]);
    Navigator.pushReplacementNamed(context, '/navbar');
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
    currentUser.setiscreator(_data["iscreator"]);
    currentUser.setisverified(_data["isverified"]);
    currentUser.setprofile_image(_data["profile_image"]);
    currentUser.setfollowers(_data["followers"]);
    currentUser.setfollowing(_data["following"]);
  }

  registerUser() async {
    var _token = await _authservices.generateToken(key_word);
    var userObject = {
      "email": _email,
      "token": _token,
      "phone": _phone,
      "password": _pass,
      "username": _username
    };
    print(userObject);
    var res = await _authservices.registerUser(userObject);
    print(res.body);
    setCurUser(int.parse(jsonDecode(res.body)["uid"]));
  }

  setCurUser(int id) {
    currentUser.setemail(_email);
    currentUser.setphone(_phone);
    currentUser.setusername(_username);
    currentUser.setname(_name);
    currentUser.setuid(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: blueColor, // Status bar color
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(height: getheight(context, 20)),
        Center(
          child: Image(
            image: AssetImage("images/logo.png"),
            height: getheight(context, 162),
            width: getheight(context, 172),
          ),
        ),
        // Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF4F5B79).withOpacity(0.15),
                spreadRadius: 0,
                blurRadius: 22,
                offset: Offset(0, 4),
              ),
            ],
            color: blueColor,
          ),
          height: getheight(context, 580),
          child: Column(
            children: [
              SizedBox(
                height: getheight(context, 24),
              ),
              TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.white.withOpacity(0.75),
                  tabs: const [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign-up",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ]),
              SizedBox(height: getheight(context, 24)),
              Expanded(
                child: Container(
                  // width: double.infinity,
                  // height: MediaQuery.of(context).size.height*0.6245,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF5282F).withOpacity(0.09),
                        spreadRadius: 0,
                        blurRadius: 32,
                        offset: Offset(0, -25),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: new BorderRadius.vertical(
                      top: Radius.elliptical(28, 28),
                    ),
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: getheight(context, 32),
                            left: getwidth(context, 40),
                            right: getwidth(context, 40)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Welcome back",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 12),
                            ),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Login with your account")),
                            SizedBox(
                              height: getheight(context, 37),
                            ),
                            // Text("Email address",
                            //     style: TextStyle(color: Colors.black)),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _login_username = value.replaceAll(" ", "");
                                });
                              },
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // border: InputBorder.none,
                                  hintText: "Enter Email/Phone No.",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                            // Divider(
                            //   thickness: 2,
                            //   color: blueColor,
                            // ),
                            SizedBox(
                              height: getheight(context, 20),
                            ),
                            // Text("Password",
                            //     style: TextStyle(color: Colors.black)),
                            TextField(
                                cursorColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {
                                    _login_password = value;
                                  });
                                },
                                obscureText: _isObscure,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.key_outlined,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        )),
                                    // border: InputBorder.none,
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.withOpacity(0.5)))),
                            // Divider(
                            //   thickness: 2,
                            //   color: blueColor,
                            // ),
                            SizedBox(height: getheight(context, 30)),
                            GestureDetector(
                              onTap: () {
                                loginUser();
                                // Navigator.pushNamed(context, '/onboarding');
                              },
                              child: Container(
                                height: getheight(context, 60),
                                width: getwidth(context, 295),
                                decoration: BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.25),
                                    //     spreadRadius: 3,
                                    //     blurRadius: 8,
                                    //     offset: Offset(0, 4),
                                    //   ),
                                    // ],
                                    borderRadius: BorderRadius.circular(12),
                                    color: blueColor),
                                child: const Center(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Forgot your password?  "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/enterOtp');
                                  },
                                  child: Text(
                                    "Reset here",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: blueColor),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: getheight(context, 32),
                            left: getwidth(context, 40),
                            right: getwidth(context, 40)),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Let's get started",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 12),
                            ),
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Setting things up")),
                            SizedBox(
                              height: getheight(context, 13),
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _username = value.replaceAll(" ", "");
                                });
                              },
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.person_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                            SizedBox(
                              height: getheight(context, 8),
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _name = value.replaceAll(" ", "");
                                });
                              },
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "Full name",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                            SizedBox(
                              height: getheight(context, 10),
                            ),
                            Row(
                              children: [
                                Text(
                                  "🇮🇳",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  " +91",
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: getwidth(context, 225),
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value.toString().length != 10) {
                                          return "Enter valid Number!";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        _phone = value;
                                      },
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                          hintText: "Phone number",
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey
                                                  .withOpacity(0.5)))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getheight(context, 10),
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _email = value.replaceAll(" ", "");
                                });
                              },
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.withOpacity(0.5))),
                            ),
                            SizedBox(
                              height: getheight(context, 8),
                            ),
                            TextField(
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                setState(() {
                                  _pass = value;
                                });
                              },
                              obscureText: _isObscure,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.key_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    )),
                                hintText: "Enter Password",
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 25),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await registerUser();
                                Navigator.pushNamed(context, '/onboarding');
                              },
                              child: Container(
                                height: getheight(context, 60),
                                width: getwidth(context, 295),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: blueColor),
                                child: const Center(
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
