import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notio/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isObscure = true;
  late String _email = "";
  late String _pass = "";
  late String _username = "";
  late String _name = "";
  late String _phone = "";
  List<String> collegelist = ["HPU", "HPTU", "CU"];
  String dropdownValue = "Select University";

  @override
  void initState() {
    super.initState();
    collegelist = ["Select University", "HPU", "HPTU", "CU"];
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: getheight(context, 20)),
        Container(
          child: Center(
            child: Image(
              image: AssetImage("images/logo.png"),
              height: getheight(context, 172),
              width: getheight(context, 172),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                color: blueColor,
              ),
              height: getheight(context, 620),
              child: Column(
                children: [
                  SizedBox(
                    height: getheight(context, 24),
                  ),
                  TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sign-up",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ]),
                  SizedBox(height: getheight(context, 24)),
                  Expanded(
                    child: Container(
                      // width: double.infinity,
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
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
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
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
                                      _email = value.replaceAll(" ", "");
                                    });
                                  },
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(
                                          Icons.email_outlined,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Enter Email",
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.withOpacity(0.5))),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: blueColor,
                                ),
                                SizedBox(
                                  height: getheight(context, 20),
                                ),
                                // Text("Password",
                                //     style: TextStyle(color: Colors.black)),
                                TextField(
                                    cursorColor: Colors.black,
                                    onChanged: (value) {
                                      setState(() {
                                        _pass = value;
                                      });
                                    },
                                    obscureText: _isObscure,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
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
                                        border: InputBorder.none,
                                        hintText: "Enter Password",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Colors.grey.withOpacity(0.5)))),
                                Divider(
                                  thickness: 2,
                                  color: blueColor,
                                ),
                                SizedBox(height: getheight(context, 30)),
                                GestureDetector(
                                  onTap: () {
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
                                    Text(
                                      "Reset here",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: blueColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: getheight(context, 32),
                                  left: getwidth(context, 40),
                                  right: getwidth(context, 40)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Let's get started",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Icon(
                                            Icons.person_outlined,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Colors.grey.withOpacity(0.5))),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: blueColor,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        _name = value.replaceAll(" ", "");
                                      });
                                    },
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Icon(
                                            Icons.person_outline,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Full name",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Colors.grey.withOpacity(0.5))),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: blueColor,
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
                                        width: getwidth(context, 200),
                                        child: TextFormField(
                                            validator: (value) {
                                              if (value.toString().length !=
                                                  10) {
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
                                                border: InputBorder.none,
                                                hintText: "Phone number",
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey
                                                        .withOpacity(0.5)))),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: blueColor,
                                  ),
                                  DropdownButton<String>(
                                    menuMaxHeight: 260,
                                    isExpanded: true,
                                    value: dropdownValue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    underline: Container(
                                      color: Colors.transparent,
                                    ),
                                    onChanged: (newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: collegelist
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: blueColor,
                                  ),
                                  // SizedBox(height: getheight(context, 15)),
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        _email = value.replaceAll(" ", "");
                                      });
                                    },
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Icon(
                                            Icons.email_outlined,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Colors.grey.withOpacity(0.5))),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: blueColor,
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
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
                                          border: InputBorder.none,
                                          hintText: "Enter Password",
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey
                                                  .withOpacity(0.5)))),
                                  Divider(
                                    thickness: 2,
                                    color: blueColor,
                                  ),
                                  SizedBox(
                                    height: getheight(context, 20),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/onboarding');
                                    },
                                    child: Container(
                                      height: getheight(context, 60),
                                      width: getwidth(context, 295),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
