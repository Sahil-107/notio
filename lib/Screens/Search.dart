import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:notio/widgets.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _search = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: getheight(context, 55),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: getwidth(context, 25)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _search = value;
              });
            },
            decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: EdgeInsets.only(left: getwidth(context, 120)),
                    child: Icon(Icons.search)),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                    fontSize: 20, color: Colors.grey.withOpacity(0.5))),
          ),
        ),
        Spacer(),
        Image(image: AssetImage("images/search1.png"))
      ],
    ));
  }
}
