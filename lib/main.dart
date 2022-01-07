import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(AppPrefs());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: AppTheme.lightMode,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
