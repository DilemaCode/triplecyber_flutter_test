import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OddController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<int> oddList = [];
  TextEditingController textController = TextEditingController(text: '9');

  void getOddRandomNumber() {
    oddList = [];
    Random random = Random();
    do {
      int randomInt = random.nextInt(100) + 1;
      if (randomInt.isOdd) {
        oddList.add(randomInt);
      }
    } while (oddList.length < int.parse(textController.text));
    update();
  }

}
