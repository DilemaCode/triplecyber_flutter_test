import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AtmController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<String> bills = [];
  TextEditingController textController = TextEditingController(text: '100');
  bool isLoading = false;


  void calculateBills() {
    int amout = int.parse(textController.text);

    Map deno = {
      "2000": amout ~/ 2000,
      "1000": amout ~/ 1000,
      "500": amout ~/ 500,
      "200": amout ~/ 200,
      "100": amout ~/ 100,
      "50": amout ~/ 50,
      "25": amout ~/ 25,
      "10": amout ~/ 10,
      "5": amout ~/ 5,
      "1": amout ~/ 1,
    };

    deno.keys.map((e) {
      var value = deno[e];
      String isBill = int.parse(e) >= 50 ? 'billete' : 'moneda';
      if (value != 0) {
        bills.add('$value ${isBill + (value > 1 ? 's' : '')} de $e');
      }
    }).toList();

    update();
  }

  callLoading()async{
    isLoading=true;
    update();
    await Future.delayed(const Duration(seconds: 5));
    clearAll();
  }

  clearAll(){
    bills.clear();
    isLoading=false;
    update();
  }

}
