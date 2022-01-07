import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_malamu_patient/app/models/model_export.dart';
import 'package:health_malamu_patient/app/services/server/http/http_service.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AppPrefs {
  static AppPrefs get to => Get.find<AppPrefs>();

  final languageCode = ReadWriteValue('language_code', 'fr_FR');

  final token = ReadWriteValue('token', '');

  final deviceId = ReadWriteValue('device_id', '');

  UserInfoResult? userInfo;
  final userId = ReadWriteValue('user_id', '');
  final userCachedInfo = ReadWriteValue('user_cached_info', '');

  AppPrefs() {
    GetStorage.init();
    initData();
  }

  void initData() async {
    initializeDateFormatting();
    Intl.defaultLocale = 'fr_FR';
    await GetStorage.init();
    HttpOverrides.global = AppHttpOverrides();

    getDeviceIdentity();
  }

  getDeviceIdentity() async {
    final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
    if (AppPrefs.to.deviceId.val == '') {
      String _deviceIdentity = '';
      try {
        if (Platform.isAndroid) {
          AndroidDeviceInfo info = await _deviceInfoPlugin.androidInfo;
          _deviceIdentity = "${info.device}-${info.id}";
        } else if (Platform.isIOS) {
          IosDeviceInfo info = await _deviceInfoPlugin.iosInfo;
          _deviceIdentity = "${info.model}-${info.identifierForVendor}";
        }
      } on PlatformException {
        _deviceIdentity = "unknown";
      } finally {
        deviceId.val = _deviceIdentity;
      }
    }
  }
}
