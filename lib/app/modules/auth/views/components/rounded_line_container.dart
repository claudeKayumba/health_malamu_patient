import 'package:health_malamu_patient/app/utils/app_plugins.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({Key? key, this.height, this.width, this.color})
      : super(key: key);

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      height: height ?? 8.0,
      width: width ?? 150.0,
      decoration: BoxDecoration(
        color: color ?? AppColors.RED_COLOR,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
