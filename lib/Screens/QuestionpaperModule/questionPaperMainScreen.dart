import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:notio/Screens/Menu/Menu.dart';
import 'package:notio/apiServices/questionPaperService.dart';
import 'package:notio/appServices/pdfViewModule.dart';
import 'package:notio/main.dart';

import '../../utility.dart';
import '../Saved.dart';

class QuestionPaperMainScreen extends StatefulWidget {
  const QuestionPaperMainScreen({super.key});

  @override
  State<QuestionPaperMainScreen> createState() =>
      _QuestionPaperMainScreenState();
}

class _QuestionPaperMainScreenState extends State<QuestionPaperMainScreen> {
  
  questionPaperService _qps = new questionPaperService();

  List _questionPapers = [];

  @override
  void initState() {
    getQuestionPapers();
    super.initState();
  }

  getQuestionPapers() async {
    Map<String, Object> data = {
      "Course": currentUser.branch,
      "Sem": currentUser.sem,
      "University": currentUser.university,
      "College": currentUser.college,
    };
    var rdata = await _qps.getQuestionPapers(data);
    for (var element in json.decode(rdata.body)["QuestionPapers"]) {
      _questionPapers.add({       
        "subject": element["subject_name"],
        "image": element["image"].toString().obs,
        "url":element["link"]
    });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fbff),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.blue, // Status bar color
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getheight(context, 20)),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Question Papers",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Menu()));
                          },
                          child: Icon(
                            Icons.account_circle,
                            size: 35,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: getheight(context, 35),
                ),
                // Container(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
                //   child: Column(children: _questionPapers),
                // ),
                CarouselSlider(
                options: CarouselOptions(
                    clipBehavior: Clip.none,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                    height: getheight(context, 280)),
                items: _questionPapers.map((qpData) {
                  return Builder(
                    builder: (BuildContext context) {
                      return QuestionPaperWid(
                        data: qpData,
                      );
                    },
                  );
                }).toList(),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class QuestionPaperWid extends StatelessWidget {
  Map data;
  QuestionPaperWid({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PdfViewModule(title: data["subject"],url: data["url"],));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => NoteModule()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            image: DecorationImage(
                image: MemoryImage(
                  base64Decode(data["image"].value),
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(28)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  getwidth(context, 25), 0, 0, getheight(context, 20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.6)),
                child: Text(
                  data["subject"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

