import 'package:get/get.dart';

class HomeController extends GetxController {
  final tabIndex = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}

  void updatetabIndex(int value) {
    tabIndex.value = value;
  }

  void menuAction(String route) {
    Get.toNamed(route);
  }
}
