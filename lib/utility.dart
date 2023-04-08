import 'package:flutter/material.dart';

double getheight(context, value) {
  return MediaQuery.of(context).size.height * (value / 812);
}

double getwidth(context, value) {
  return MediaQuery.of(context).size.width * (value / 375);
}

Color bg = const Color(0xfff9fbff);

Color blueColor = const Color(0xff0092f2);
