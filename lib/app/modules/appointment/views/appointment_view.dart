import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_malamu_patient/app/models/appointment_result.dart';
import 'package:health_malamu_patient/app/services/server/http/error_handler_notification.dart';
import 'package:health_malamu_patient/app/services/server/http/http_service.dart';
import 'package:health_malamu_patient/app/shared/widgets/appointment_item.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';

import '../controllers/appointment_controller.dart';

class AppointmentView extends GetView<AppointmentController>
    with ErrorHandlerNotification {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      appBar: AppBar(
        title: const Text('Rendez-vous'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            padding: const EdgeInsets.all(8.0),
            child: DatePicker(
              DateTime.now(),
              width: 60,
              locale: 'fr_FR',
              dateTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: AppColors.BLACK_COLOR,
              ),
              monthTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: Colors.black45,
              ),
              dayTextStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
                color: Colors.black45,
              ),
              controller: controller.datePcontroller,
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.RED_COLOR,
              selectedTextColor: Colors.white,
              inactiveDates: [
                DateTime.now().add(const Duration(days: 3)),
                DateTime.now().add(const Duration(days: 4)),
                DateTime.now().add(const Duration(days: 7))
              ],
              onDateChange: (date) {
                controller.selectedDateValue = date;
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: HttpService.request(HttpMethode.GET, Api.appointments,
                  queryParameters: {
                    "filter": "concerned",
                    "set": AppPrefs.to.userInfo!.user!.id,
                  }).catchError(handleErrorMessage),
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                    (snapshot.hasError &&
                        snapshot.connectionState == ConnectionState.waiting)) {
                  return ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const AppointmentItem();
                    },
                  );
                } else {
                  final AppointmentResult result = AppointmentResult.fromJson(
                      snapshot.data as Map<String, dynamic>);
                  return ListView.builder(
                    itemCount: result.appointments!.length,
                    itemBuilder: (context, index) {
                      final model = result.appointments![index];
                      return AppointmentItem(model: model);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
