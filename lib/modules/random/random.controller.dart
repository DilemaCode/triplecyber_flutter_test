import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/global/controllers/global.controller.dart';

class RandomController extends GetxController {
  Random random = Random();
  int randomValue = 5;
  List<int> randomList = [];
  String textTest = '';
  TextEditingController textController = TextEditingController(text: '5');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    randomList = GlobalController.instance.randomList;
  }

  void getRandomNumber() {
    randomList = [];
    do {
      int randomInt = random.nextInt(100) + 1;
      if (!randomList.contains(randomInt)) {
        randomList.add(randomInt);
      }
    } while (randomList.length < int.parse(textController.text));
    GlobalController.instance.updateRandomList(randomList);
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
