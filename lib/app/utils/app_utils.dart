import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static void displayToast({
    IconData? icon,
    String title = 'Avertissement',
    String? message,
    SnackPosition snackPosition = SnackPosition.TOP,
  }) {
    Get.snackbar(
      title,
      '$message',
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: AppColors.DARK_COLOR,
      colorText: AppColors.WHITE_COLOR,
      snackPosition: snackPosition,
      icon: Icon(
        icon ?? Ionicons.warning_outline,
        color: Colors.red,
        size: 30.0,
      ),
    );
  }

  static String getDateFormat(DateTime date) {
    return DateFormat.yMMMMEEEEd().format(date);
  }

  static String getStringDateFormat(String date) {
    return DateFormat.yMMMMEEEEd().format(DateTime.parse(date.toString()));
  }

  static String getStringTimeFormat(String time) {
    int hour = int.tryParse(time.split(':')[0])!;
    int minute = int.tryParse(time.split(':')[1])!;
    final formatedTime = TimeOfDay(hour: hour, minute: minute);
    return formatedTime.format(Get.context!);
  }
}
