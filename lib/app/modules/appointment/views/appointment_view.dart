import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/appointment_controller.dart';

class AppointmentView extends GetView<AppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppointmentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AppointmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
