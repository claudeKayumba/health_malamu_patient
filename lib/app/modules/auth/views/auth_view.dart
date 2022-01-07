import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_malamu_patient/app/modules/auth/controllers/auth_controller.dart';
import 'package:health_malamu_patient/app/shared/components/primary_button.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';

import 'components/rounded_line_container.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login to your\naccount',
                    style: TextStyle(
                      color: AppColors.DARK_COLOR,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      LineContainer(),
                      LineContainer(
                        width: 10.0,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.WHITE_COLOR,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        controller: controller.userIDCtrl,
                        decoration: const InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(
                          //     horizontal: 8.0, vertical: 12.0),
                          filled: true,
                          hintText: 'Identifiant',
                          hintStyle: TextStyle(color: AppColors.GREY_COLOR),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.WHITE_COLOR,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.0)),
                      ),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.passwordCtrl,
                          obscureText: !controller.passwordVisible.value,
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.symmetric(
                            //     horizontal: 8.0, vertical: 12.0),
                            filled: true,
                            hintText: 'Mot de passe',
                            hintStyle:
                                const TextStyle(color: AppColors.GREY_COLOR),
                            suffixIcon: IconButton(
                              color: AppColors.GREY_COLOR,
                              splashRadius: 1,
                              icon: Icon(controller.passwordVisible.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: controller.togglePassword,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(16.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => CustomPrimaryButton(
                    buttonColor: AppColors.RED_COLOR,
                    textValue: 'Se connecter',
                    textColor: Colors.white,
                    isLoading: controller.isLoading.value,
                    onPressed: () {
                      if (!controller.isLoading.value) {}
                      controller.login();
                    },
                  )),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text(
                  'OU',
                  style: TextStyle(color: AppColors.GREY_COLOR),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomPrimaryButton(
                buttonColor: AppColors.DARK_COLOR,
                textValue: 'Demender une iscription',
                textColor: AppColors.DARK_COLOR,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Pour plus d'info ",
                    style: TextStyle(color: AppColors.GREY_COLOR),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.offNamed(Routes.HOME);
                    },
                    child: const Text(
                      'Nous contacter',
                      style: TextStyle(
                        color: AppColors.DARK_COLOR,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
