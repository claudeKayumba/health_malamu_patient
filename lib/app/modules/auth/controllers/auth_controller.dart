import 'package:get/get.dart';
import 'package:health_malamu_patient/app/services/server/http/error_handler_notification.dart';
import 'package:health_malamu_patient/app/services/server/http/http_service.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';

class AuthController extends GetxController with ErrorHandlerNotification {
  final passwordVisible = false.obs;
  final userIDCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final isLoading = false.obs;

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

  void togglePassword() {
    passwordVisible(!passwordVisible.value);
  }

  Future<void> login() async {
    if (Get.focusScope!.hasFocus) {
      Get.focusScope!.unfocus();
    }
    bool succes = false;
    try {
      if (userIDCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
        isLoading(true);
        print({
          "email": userIDCtrl.text,
          "password": passwordCtrl.text,
          "device_name": AppPrefs.to.deviceId.val
        });
        await HttpService.request(HttpMethode.POST, Api.auth, data: {
          "email": userIDCtrl.text,
          "password": passwordCtrl.text,
          "device_name": AppPrefs.to.deviceId.val
        }).then((value) {
          if (value != null) {
            if (value['token'] != null) {
              AppPrefs.to.token.val = value['token'];
              succes = true;
            }
          }
        }).catchError(handleError);
      } else {
        isLoading(false);
        displayToast(
          icon: LineIcons.info,
          title: 'Avertissement',
          message: "Veuillez remplir tous les champs",
        );
      }
    } finally {
      if (succes) {
        AppTheme.setOverLayStyle(false);
        Get.offAllNamed(Routes.SPLASH);
      }
      isLoading(false);
    }
  }
}

void displayToast({
  IconData? icon,
  String? title,
  String? message,
  SnackPosition? snackPosition,
}) {
  Get.snackbar(
    '$title',
    '$message',
    backgroundColor: AppColors.WHITE_COLOR,
    colorText: AppColors.BLACK_COLOR,
    snackPosition: snackPosition,
    icon: Icon(
      icon,
      color: Colors.black,
      size: 30.0,
    ),
  );
}
