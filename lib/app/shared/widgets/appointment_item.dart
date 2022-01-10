import 'package:health_malamu_patient/app/models/appointment_result.dart';
import 'package:health_malamu_patient/app/modules/appointment/views/widgets/appointment_detail.dart';
import 'package:health_malamu_patient/app/modules/auth/views/components/rounded_line_container.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({Key? key, this.model, this.hasShadow = true})
      : super(key: key);

  final Appointment? model;
  final bool? hasShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: AppColors.WHITE_COLOR,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: hasShadow!
            ? [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey.shade100,
                  offset: const Offset(4, 4),
                )
              ]
            : null,
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => AppointmentDetail(model: model));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: model?.medecin?.avatar != null ? 90.0 : 120,
              width: 100.0,
              margin:
                  EdgeInsets.all(model?.medecin?.avatar != null ? 8.0 : 0.0),
              decoration: BoxDecoration(
                color: AppColors.GREY_COLOR
                    .withOpacity(model?.medecin?.avatar != null ? 0.0 : 0.2),
                borderRadius: BorderRadius.circular(10.0),
                image: model != null
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(
                          model?.medecin?.avatar ??
                              'https://lakeforestgroup.com/wp-content/uploads/2014/11/doctor-profile-02.jpg',
                        ),
                        fit: model?.medecin?.avatar != null
                            ? BoxFit.contain
                            : BoxFit.cover,
                      )
                    : null,
              ),
            ),
            5.widthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (model == null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: LineContainer(
                      width: 100.0,
                      color: AppColors.GREY_COLOR.withOpacity(0.2),
                    ),
                  )
                else
                  Text(
                    (model?.medecin?.noms ?? 'Dr Antoine Cary').capitalize!,
                    style: const TextStyle(
                      color: AppColors.DARK_COLOR,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (model == null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: LineContainer(
                      width: 80.0,
                      color: AppColors.BLUE_COLOR.withOpacity(0.2),
                    ),
                  )
                else
                  const Text(
                    'Spécialité...',
                    style: TextStyle(
                      color: AppColors.BLUE_COLOR,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (model == null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: LineContainer(
                      width: 60.0,
                      color: AppColors.GREY_COLOR.withOpacity(0.2),
                    ),
                  )
                else
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
      ),
    );
  }
}
