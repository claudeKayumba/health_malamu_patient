import 'dart:async';

import 'package:get/get.dart';
import 'package:health_malamu_patient/app/models/model_export.dart';
import 'package:health_malamu_patient/app/services/server/http/error_handler_notification.dart';
import 'package:health_malamu_patient/app/services/server/http/http_service.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:health_malamu_patient/app/utils/dialog_helper.dart';

class SplashController extends GetxController with ErrorHandlerNotification {
  String logoUrl = 'assets/img/ic_launcher.png';

  @override
  void onInit() {
    super.onInit();
    init();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}

  init() {
    Timer(
      3.seconds,
      () {
        if (AppPrefs.to.token.val.isEmpty) {
          Get.offNamed(Routes.START_PAGE);
        } else {
          userInfo();
        }
      },
    );
  }

  Future<void> userInfo() async {
    await HttpService.request(HttpMethode.GET, Api.userInfo).then((value) {
      if (value['user'] != null) {
        UserInfoResult result = UserInfoResult.fromJson(value);
        if (result.user!.role == "user") {
          AppPrefs.to.userInfo = result;
          Get.offAllNamed(Routes.HOME);
        } else {
          DialogHelper.showSimpleDialog(
            title: 'Erreur',
            description:
                "Vous n'êtes pas autorisé à vous connecter étant que Patient",
          );
          Get.offAllNamed(Routes.AUTH);
        }
      }
    }).catchError(handleError);
  }
}
