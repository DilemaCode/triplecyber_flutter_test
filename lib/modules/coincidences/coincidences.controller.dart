import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/global/controllers/global.controller.dart';
import 'package:triplecyber_test/modules/random/random.controller.dart';

class CoincidencesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<int> oddList = [];
  List<int> fibonacci = [];
  TextEditingController textController = TextEditingController(text: '9');
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCoincidences();
  }

  void getCoincidences() {
    oddList = [];
    fibonacci = [];
    oddList = GlobalController.instance.randomList.where((n) => n.isOdd).toList();
    int bigOdd = oddList.reduce(max);
    fibonacci = getFibonacci(bigOdd);
    update();
  }

  getRandomNumbersList(){
    Get.put(RandomController());

  }

  List<int> getFibonacci(int n) {
    List<int> fibonacci = [1, 1];
    for (int i = 2; i < n; i++) {
      fibonacci.add(fibonacci[i - 1] + fibonacci[i - 2]);
    }
    return fibonacci;
  }

}
