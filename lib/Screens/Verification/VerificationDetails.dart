import 'package:flutter/material.dart';
import 'package:notio/Screens/Verification/underVerificationPage.dart';
import 'package:notio/apiServices/creatorService.dart';
import 'package:notio/main.dart';

import '../../utility.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  Map<String, Object> _data = {
    "id": currentUser.id,
  };

  creatorServices _creatorservices = new creatorServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue, // Status bar color
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getheight(context, 25)),
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
                      _data["panName"] = value.toString();
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
                    textCapitalization: TextCapitalization.characters,
                    onChanged: (value) {
                      _data["panNo"] = value.toString();
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
                      _data["dob"] = value.toString();
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
                      _data["phone"] = value.toString();
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
                      _data["upiId"] = value.toString();
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
                    onTap: () async {
                      await _creatorservices.onBoardCreator(_data);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => creatorUnderVerification(),
                        ),
                      );
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
