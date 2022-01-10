import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_malamu_patient/app/shared/components/primary_button.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

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
            title: 'Profile Utulisaateur'
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.heightBox,
              Row(
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: AppColors.GREY_COLOR.withOpacity(0.2),
                      // borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: AppColors.GREY_COLOR.withOpacity(0.2),
                          width: 3.0),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          AppPrefs.to.userInfo?.user?.avatar ??
                              'https://lakeforestgroup.com/wp-content/uploads/2014/11/doctor-profile-02.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  10.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppPrefs.to.userInfo!.user!.fullName,
                        style: const TextStyle(
                            color: AppColors.DARK_COLOR,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        AppPrefs.to.userInfo!.user!.email!,
                        style: const TextStyle(
                          color: AppColors.BLUE_COLOR,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              10.heightBox,
              CustomPrimaryButton(
                buttonColor: AppColors.RED_COLOR,
                textValue: 'Se déconnecter',
                textColor: Colors.white,
                onPressed: () {
                  AppPrefs.to.token.val = '';
                  Get.offAllNamed(Routes.SPLASH);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
