import 'package:flutter/material.dart';
import 'package:health_malamu_patient/app/models/appointment_result.dart';
import 'package:health_malamu_patient/app/services/server/http/error_handler_notification.dart';
import 'package:health_malamu_patient/app/services/server/http/http_service.dart';
import 'package:health_malamu_patient/app/shared/widgets/appointment_item.dart';
import 'package:health_malamu_patient/app/shared/widgets/consulting_items.dart';
import 'package:health_malamu_patient/app/shared/widgets/sliver_header.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> with ErrorHandlerNotification {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.WHITE_COLOR,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Welcome Back !'
                            .text
                            .textStyle(
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: AppColors.BLACK_COLOR,
                              ),
                            )
                            .make(),
                        Text(
                          'Hi ${AppPrefs.to.userInfo!.user!.fullName}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.GREY_COLOR,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45.0,
                    width: 45.0,
                    child: RawMaterialButton(
                      elevation: 0.0,
                      fillColor: AppColors.WHITE_COLOR,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Colors.grey.shade100,
                          )),
                      onPressed: () {
                        Get.toNamed(Routes.PROFILE);
                      },
                      child: const Icon(
                        Ionicons.notifications_outline,
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ).pSymmetric(h: 8.0, v: 5),
            ),
          ),
        ),
        body: GetBuilder<HomeController>(
            init: controller,
            builder: (logic) {
              return RefreshIndicator(
                onRefresh: () {
                  logic.update();

                  return Future.delayed(3.seconds);
                },
                backgroundColor: AppColors.RED_COLOR,
                color: Colors.white,
                strokeWidth: 2.0,
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      floating: true,
                      pinned: false,
                      delegate: SliverAppBarDelegate(
                        color: AppColors.WHITE_COLOR,
                        widget: PreferredSize(
                          preferredSize: const Size.fromHeight(60.0),
                          child: SizedBox(
                            height: 60.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60.0,
                                      margin: const EdgeInsets.all(5.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF7F4FB),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              'Votre passeport Santé',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.GREY_COLOR,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Ionicons.search_sharp,
                                            color: AppColors.GREY_COLOR,
                                            size: 20.0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 45.0,
                                    width: 45.0,
                                    child: RawMaterialButton(
                                      elevation: 0.0,
                                      fillColor: AppColors.RED_COLOR,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                          color: Colors.grey.shade100,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Icon(
                                        LineIcons.horizontalSliders,
                                        size: 20.0,
                                        color: AppColors.WHITE_COLOR,
                                      ),
                                    ),
                                  ),
                                  10.widthBox
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Mes Données',
                            style: TextStyle(
                                color: AppColors.DARK_COLOR,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Voir Plus',
                            style: TextStyle(
                              color: AppColors.BLUE_COLOR,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ).sliverBox,
                    GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3.0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        {
                          'icon': Ionicons.documents_outline,
                          'title': 'Carnet Medical',
                          'sub_title': 'Lorem ipsum',
                          'color': AppColors.YELLOW_COLOR,
                          'route': Routes.APPOINTMENT,
                        },
                        {
                          'icon': Ionicons.calendar_number_sharp,
                          'title': 'Rendez-vous',
                          'sub_title': 'Lorem ipsum',
                          'color': AppColors.PURPLE_COLOR,
                          'route': Routes.APPOINTMENT,
                        },
                        {
                          'icon': Ionicons.medical,
                          'title': 'Consultations. ',
                          'sub_title': 'Lorem ipsum',
                          'color': AppColors.RED_COLOR,
                          'route': Routes.CONSULTING,
                        },
                        {
                          'icon': Ionicons.medical,
                          'title': 'Antecédant',
                          'sub_title': 'Lorem ipsum',
                          'color': AppColors.BLUE_COLOR,
                          'route': Routes.APPOINTMENT,
                        },
                      ]
                          .map(
                            (menu) => Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                color: AppColors.WHITE_COLOR,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.grey.shade100,
                                    offset: const Offset(4, 4),
                                  )
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  controller
                                      .menuAction(menu['route'].toString());
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 45.0,
                                      width: 45.0,
                                      decoration: BoxDecoration(
                                        color: menu['color'] as Color,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Icon(
                                        menu['icon'] as IconData,
                                        color: AppColors.WHITE_COLOR,
                                      ),
                                    ),
                                    10.widthBox,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          menu['title'].toString(),
                                          style: const TextStyle(
                                              color: AppColors.DARK_COLOR,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          menu['sub_title'].toString(),
                                          style: const TextStyle(
                                              color: AppColors.GREY_COLOR,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ).marginAll(10.0).sliverBox,
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Rendez-vous',
                            style: TextStyle(
                                color: AppColors.GREY_COLOR,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Voir Plus',
                            style: TextStyle(
                                color: AppColors.BLUE_COLOR,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ).sliverBox,
                    FutureBuilder(
                      future: HttpService.request(
                          HttpMethode.GET, Api.appointments,
                          queryParameters: {
                            "filter": "concerned",
                            "set": AppPrefs.to.userInfo!.user!.id,
                          }).catchError(handleErrorMessage),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return SizedBox(
                            height: 120.0,
                            width: Get.width,
                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const AppointmentItem();
                              },
                            ),
                          );
                        } else {
                          final AppointmentResult result =
                              AppointmentResult.fromJson(snapshot.data);
                          if (snapshot.hasError ||
                              result.appointments!.isEmpty) {
                            return Center(
                              child: Column(
                                children: [
                                  const Icon(
                                    Ionicons.calendar_outline,
                                    color: AppColors.GREY_COLOR,
                                    size: 50.0,
                                  ),
                                  5.heightBox,
                                  const Text(
                                    'Aucune donnée trouvée',
                                    style: TextStyle(
                                        color: AppColors.GREY_COLOR,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            );
                          }
                          return SizedBox(
                            height: 120.0,
                            width: Get.width,
                            child: ListView.builder(
                              itemCount: result.appointments!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final model = result.appointments![index];
                                return AppointmentItem(model: model);
                              },
                            ),
                          );
                        }
                      },
                    ).sliverBox,
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Consultations',
                            style: TextStyle(
                                color: AppColors.GREY_COLOR,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Voir Plus',
                            style: TextStyle(
                              color: AppColors.BLUE_COLOR,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ).sliverBox,
                    const ConsulingItems().sliverBox,
                  ],
                ),
              );
            }),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              elevation: 4.0,
              backgroundColor: AppColors.DARK_COLOR,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.dashcube),
                  label: 'Vu d\'ens.',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.alternateMedicalFile),
                  label: 'Carnet Med.',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Ionicons.calendar_outline),
                  label: 'Rendez-vous',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.userCircle),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: AppColors.RED_COLOR,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
              unselectedItemColor: Colors.grey.shade500,
              currentIndex: controller.tabIndex.value,
              onTap: controller.updatetabIndex,
              // onTap: controller.changeNavIndex,
            )),
      ),
    );
  }
}
