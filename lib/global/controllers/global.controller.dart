import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController instance = Get.find();
  List<int> randomList = [];

  updateRandomList(List<int> list) {
    randomList = list;
    update();
  }

}
