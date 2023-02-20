import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:triplecyber_test/global/controllers/global.controller.dart';
import 'package:triplecyber_test/modules/random/random.controller.dart';

void main() {
  late final RandomController controller;
  setUpAll(() {
    controller = RandomController();
    Get.put(GlobalController());
  });
  group('When the controller is instantiated > ', () {
    //
    test('the randomValue must contain the value of 5', () {
      //assets
      expect(controller.randomValue, 5);
    });

    test('the randomList must contain an empty array', () {
      //assets
      expect(controller.randomList, []);
    });
    test('the textController must contain the value of 5', () {
      //assets
      expect(controller.textController.text, '5');
    });
  });

  test(
      'The textController.text should be the length of the randomList property',
      () {
    //arrange
    //act
    const count = 10;
    controller.textController.text = count.toString();
    controller.getRandomNumber();
    //assets
    expect(controller.randomList.length, count);
  });
}