import 'package:flutter/material.dart';
import 'package:health_malamu_patient/app/shared/widgets/consulting_items.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';

import '../controllers/consulting_controller.dart';

class ConsultingView extends GetView<ConsultingController> {
  const ConsultingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.WHITE_COLOR,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            leading: RawMaterialButton(
              onPressed: () {
                Get.back();
              },
              child: const Icon(
                Icons.keyboard_backspace,
              ),
            ),
            title: 'Consultation'
                .text
                .textStyle(
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: AppColors.BLACK_COLOR,
                  ),
                )
                .make(),
          ),
        ),
        body: const ConsulingItems(
          shrinkWrap: false,
        ),
      ),
    );
  }
}
