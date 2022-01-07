import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/consulting_controller.dart';

class ConsultingView extends GetView<ConsultingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConsultingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConsultingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
