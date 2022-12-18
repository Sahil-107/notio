import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets.dart';

class NewContribution extends StatelessWidget {
  const NewContribution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getheight(context, 60)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
              child: Column(
                children: [
                  Text(
                    "Contribution",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: getheight(context, 40),
                  ),
                  TextField(
                    onChanged: (value) {
                      // setState(() {
                      //   _email = value.replaceAll(" ", "");
                      // });
                    },
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: "Enter Email",
                        hintStyle: TextStyle(
                            fontSize: 16, color: Colors.grey.withOpacity(0.5))),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
