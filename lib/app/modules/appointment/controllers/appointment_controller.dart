import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class AppointmentController extends GetxController {
  DatePickerController datePcontroller = DatePickerController();
  DateTime selectedDateValue = DateTime.now(); // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}
}
