import 'package:health_malamu_patient/app/utils/app_plugins.dart';
import 'package:velocity_x/velocity_x.dart';

class ConsulingItems extends StatelessWidget {
  const ConsulingItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
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
                    Icon(
                      Icons.medical_services,
                      color: Color(0xFF5B6CE6),
                      size: 15,
                    ),
                    5.widthBox,
                    Text(
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
                    Icon(
                      LineIcons.alternateMedicalFile,
                      color: Color(0xFF5B6CE6),
                      size: 15,
                    ),
                    5.widthBox,
                    Text(
                      '# HM-4848-2022',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.BLACK_COLOR,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Icon(
                      LineIcons.calendar,
                      color: Color(0x9A474880),
                      size: 15,
                    ),
                    5.widthBox,
                    Text(
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
                Divider(),
                Text(
                  'Plainte',
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
                    "Maud de tete",
                    "Douleur",
                    "Fievre",
                    "Taux",
                    "Cancer",
                    "Lorem ipsum",
                    "Systematique"
                  ]
                      .map(
                        (plainte) => Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: AppColors.WHITE_COLOR,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.red, width: .6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                LineIcons.bug,
                                color: Colors.red,
                                size: 15,
                              ),
                              5.widthBox,
                              Text(
                                '$plainte',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
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
                Divider(),
                Text(
                  'Note',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.BLACK_COLOR,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Lorem ipsum dolor emet dolor alla sit et manisimo de la mosi cora estado la muta',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                  // textAlign: TextAlign.center,
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      'Ordonance',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.BLACK_COLOR,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Icon(
                      LineIcons.doctor,
                      color: Color(0xFF5B6CE6),
                      size: 15,
                    ),
                    5.widthBox,
                    Text(
                      'Dr Natalie Durant',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.BLACK_COLOR,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                5.heightBox,
                Wrap(
                  runSpacing: 6.0,
                  spacing: 5.0,
                  children: [
                    "Paracetamole",
                    "Quinine",
                    "Dolarene",
                  ]
                      .map(
                        (plainte) => Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: AppColors.WHITE_COLOR,
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: Color(0xFF5B6CE6), width: .6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.medication_rounded,
                                color: Color(0xFF5B6CE6),
                                size: 15,
                              ),
                              5.widthBox,
                              Text(
                                '$plainte',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
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
              ],
            ),
          );
        });
  }
}
