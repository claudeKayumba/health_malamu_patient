import 'package:flutter/material.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show Error Dialog
  static void showErrorDialog(
      {String title = 'Message', String description = 'Something went wrong'}) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Ionicons.warning,
                  color: Colors.red,
                  size: 35.0,
                ),
                5.widthBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      8.heightBox,
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                      const Divider(),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.BLACK_COLOR,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                5.widthBox,
                RawMaterialButton(
                  elevation: 0.0,
                  fillColor: AppColors.WHITE_COLOR,
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Fermer',
                    style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      enableDrag: false,
      isDismissible: false,
    );
  }

  static void showSimpleDialog({
    String title = 'Error',
    String description = 'Something went wrong',
    String svgPath = 'assets/svg/sign_in.svg',
  }) {
    Get.dialog(
      SimpleDialog(
        contentPadding: const EdgeInsets.all(10.0),
        children: [
          10.heightBox,
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                color: AppColors.BLACK_COLOR,
              ),
            ),
          ),
          10.heightBox,
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                description.tr,
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                elevation: 0.0,
                fillColor: AppColors.WHITE_COLOR,
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Fermer',
                  style: TextStyle(
                    color: AppColors.PRIMARY_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  static void showLoadingDialog(
      {String message = 'Loading', bool isDismissible = false}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                message,
                style: const TextStyle(
                  color: AppColors.BLACK_COLOR,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: isDismissible,
    );
  }

  static void showToast({
    IconData? icon,
    String? title,
    String? description,
    SnackPosition? snackPosition,
  }) {
    Get.snackbar(
      title ?? 'Message',
      '$description',
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: Colors.white,
      colorText: AppColors.BLACK_COLOR,
      snackPosition: snackPosition,
      icon: const Icon(
        Ionicons.help,
        color: AppColors.BLACK_COLOR,
        size: 35.0,
      ),
      overlayBlur: 3,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 2,
          offset: const Offset(2, 2),
        ),
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 2,
          offset: const Offset(-2, -2),
        )
      ],
    );
  }

  static void bottomSheet(Widget child, {bool isScrollControlled = false}) {
    Get.bottomSheet(
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 45.0),
            decoration: BoxDecoration(
              color: AppColors.WHITE_COLOR,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: child,
          ),
        ),
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: isScrollControlled);
  }
}
