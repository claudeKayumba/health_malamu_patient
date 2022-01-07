import 'package:get/get.dart';

import '../controllers/consulting_controller.dart';

class ConsultingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsultingController>(
      () => ConsultingController(),
    );
  }
}
