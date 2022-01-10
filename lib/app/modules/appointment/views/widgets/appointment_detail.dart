import 'package:health_malamu_patient/app/models/appointment_result.dart';
import 'package:health_malamu_patient/app/utils/app_colors.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentDetail extends StatelessWidget {
  const AppointmentDetail({Key? key, this.model}) : super(key: key);
  final Appointment? model;

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
            title: 'Appointment'
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
              doctorSide(
                model: model,
              ),
              20.0.heightBox,
              const Text(
                "Description",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.DARK_COLOR),
                textAlign: TextAlign.center,
              ),
              10.heightBox,
              Text(
                model!.description!,
                // "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans.",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.GREY_COLOR,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 75.0,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 60.0,
              width: 250.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10.0),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    AppColors.RED_COLOR,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Me Rappeler',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    15.0.widthBox,
                    const Icon(Ionicons.alarm_outline, size: 18.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorSide({Appointment? model}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: AppColors.WHITE_COLOR,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  color: AppColors.GREY_COLOR.withOpacity(0.2),
                  // borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: AppColors.GREY_COLOR.withOpacity(0.4), width: 3.0),
                  shape: BoxShape.circle,
                  image: model != null
                      ? DecorationImage(
                          image: CachedNetworkImageProvider(
                            model.medecin?.avatar ??
                                'https://lakeforestgroup.com/wp-content/uploads/2014/11/doctor-profile-02.jpg',
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              10.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (model?.medecin?.noms ?? 'Dr Antoine Cary').capitalize!,
                    style: const TextStyle(
                        color: AppColors.DARK_COLOR,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Spécialité',
                    style: TextStyle(
                      color: AppColors.BLUE_COLOR,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    model!.appointmentTime!,
                    style: const TextStyle(
                      color: AppColors.GREY_COLOR,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          20.0.heightBox,
          Center(
            child: Container(
              height: 55.0,
              decoration: BoxDecoration(
                color: AppColors.RED_COLOR,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDA4E84),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Ionicons.alarm,
                      color: AppColors.WHITE_COLOR,
                    ),
                  ),
                  10.widthBox,
                  Text(
                    '${model.appointmentAt!} ${model.appointmentTime!}'
                        .capitalize!,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.WHITE_COLOR,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.widthBox,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
