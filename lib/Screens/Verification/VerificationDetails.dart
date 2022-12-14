import 'package:flutter/material.dart';

import '../../utility.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getheight(context, 60)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: getheight(context, 22),
                    ),
                  ),
                  SizedBox(
                    width: getwidth(context, 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Verification",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700)),
                      // SizedBox(height: getheight(context, 10)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.notifications)
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 37),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name as on PAN",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        // _email = value.replaceAll(" ", "");
                      });
                    },
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        // hintText: "Enter full name",
                        hintStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  Text(
                    "PAN no.",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        // _email = value.replaceAll(" ", "");
                      });
                    },
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        // hintText: "Enter full name",
                        hintStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  Text(
                    "Date of Birth",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        // _email = value.replaceAll(" ", "");
                      });
                    },
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        // hintText: "Enter full name",
                        hintStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        // _email = value.replaceAll(" ", "");
                      });
                    },
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        // hintText: "Enter full name",
                        hintStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  Text(
                    "UPI ID",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: getheight(context, 13),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        // _email = value.replaceAll(" ", "");
                      });
                    },
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.2),
                        ),
                        // hintText: "Enter full name",
                        hintStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: getheight(context, 23),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/verification2');
                    },
                    child: Container(
                      height: getheight(context, 42),
                      width: getwidth(context, 212),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: blueColor),
                      child: const Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getheight(context, 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
