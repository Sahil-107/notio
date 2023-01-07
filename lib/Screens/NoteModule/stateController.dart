import 'package:flutter/material.dart';
import 'package:get/get.dart';

class notePageController extends GetxController {
  var darkMode = false;
  var bg = Colors.white;
  trigger(val) {
    print(val);
    darkMode = val;
    bg = val ? Colors.black : Colors.white;
  }
}
