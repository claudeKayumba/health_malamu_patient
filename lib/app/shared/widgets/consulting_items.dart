import 'package:flutter/cupertino.dart';
import 'package:health_malamu_patient/app/models/consulting.dart';
import 'package:health_malamu_patient/app/services/server/http/http_service.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:velocity_x/velocity_x.dart';

class ConsulingItems extends StatelessWidget {
  const ConsulingItems({Key? key, this.shrinkWrap = true}) : super(key: key);
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HttpService.request(HttpMethode.GET, Api.consultations,
            queryParameters: {
              "filter": "patien_id",
              "set": AppPrefs.to.userInfo!.user!.id,
            }),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final ConsultingResult result =
              ConsultingResult.fromJson(snapshot.data as Map<String, dynamic>);

          if (snapshot.hasError || result.data!.isEmpty) {
            return Center(
              child: Column(
                children: [
                  const Icon(
                    Ionicons.document_lock,
                    color: AppColors.GREY_COLOR,
                    size: 50.0,
                  ),
                  5.heightBox,
                  const Text(
                    'Aucune Consultation trouvé',
                    style: TextStyle(
                        color: AppColors.GREY_COLOR,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          }
          return ListView.builder(
            physics: shrinkWrap
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            shrinkWrap: shrinkWrap,
            itemCount: result.data!.length,
            itemBuilder: (context, index) {
              final model = result.data![index];
              return buildItem(model: model);
            },
          );
        });
  }

  Widget buildItem({Consulting? model}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.WHITE_COLOR,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(-4, -4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.medical_services,
                color: Color(0xFF5B6CE6),
                size: 15,
              ),
              5.widthBox,
              const Text(
                'Health Africa',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.BLACK_COLOR,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          5.heightBox,
          Row(
            children: [
              const Icon(
                LineIcons.alternateMedicalFile,
                color: Color(0xFF5B6CE6),
                size: 15,
              ),
              5.widthBox,
              Text(
                '# ${model!.code}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.BLACK_COLOR,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const Icon(
                LineIcons.calendar,
                color: Color(0x9A474880),
                size: 15,
              ),
              5.widthBox,
              const Text(
                '06 Mars 2022 08:05:00',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.BLACK_COLOR,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Divider(),
          const Text(
            'Autres données',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.BLACK_COLOR,
            ),
            textAlign: TextAlign.center,
          ),
          5.heightBox,
          Wrap(
            runSpacing: 6.0,
            spacing: 5.0,
            children: [
              {"title": 'Temp', "data": model.signeTemperatureDegreC},
              {"title": 'Poids', "data": model.poids},
              {"title": 'Taille', "data": model.taille},
              {
                "title": 'Goupe Sangun',
                "data": model.groupeSangiunFacteurRhesus
              },
            ]
                .map(
                  (plainte) => Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: AppColors.WHITE_COLOR,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.red, width: .6),
                    ),
                    child: Column(
                      children: [
                        Text(
                          plainte['title'].toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          plainte['data'].toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const Divider(),
          Text(
            model.signeTemperatureFR!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
            // textAlign: TextAlign.center,
          ),
          const Divider(),
          Row(
            children: [
              const Text(
                'Responsable',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.BLACK_COLOR,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const Icon(
                LineIcons.doctor,
                color: Color(0xFF5B6CE6),
                size: 15,
              ),
              5.widthBox,
              Text(
                model.medecin!.noms!.capitalize!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.BLACK_COLOR,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          5.heightBox,
          // Wrap(
          //   runSpacing: 6.0,
          //   spacing: 5.0,
          //   children: [
          //     "Paracetamole",
          //     "Quinine",
          //     "Dolarene",
          //   ]
          //       .map(
          //         (plainte) => Container(
          //           padding: const EdgeInsets.all(5.0),
          //           decoration: BoxDecoration(
          //             color: AppColors.WHITE_COLOR,
          //             borderRadius: BorderRadius.circular(10.0),
          //             border: Border.all(color: Color(0xFF5B6CE6), width: .6),
          //           ),
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               const Icon(
          //                 Icons.medication_rounded,
          //                 color: Color(0xFF5B6CE6),
          //                 size: 15,
          //               ),
          //               5.widthBox,
          //               Text(
          //                 plainte,
          //                 style: const TextStyle(
          //                   fontSize: 12,
          //                   fontWeight: FontWeight.w400,
          //                   color: Colors.black87,
          //                 ),
          //                 textAlign: TextAlign.center,
          //               ),
          //             ],
          //           ),
          //         ),
          //       )
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}
