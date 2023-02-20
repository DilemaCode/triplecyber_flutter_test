import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  static GlobalController instance = Get.find();
  List<int> randomList = [];
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  updateRandomList(List<int> list) {
    randomList = list;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
