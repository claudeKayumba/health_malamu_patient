import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:health_malamu_patient/app/utils/app_plugins.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color? buttonColor;
  final String? textValue;
  final Color? textColor;
  final Function()? onPressed;
  final bool? isLoading;

  const CustomPrimaryButton({
    Key? key,
    this.buttonColor,
    this.textValue,
    this.textColor,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(14.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textValue!,
                    style: const TextStyle(
                      color: AppColors.WHITE_COLOR,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isLoading!) ...[
                    8.widthBox,
                    const SizedBox(
                      height: 12.0,
                      width: 12.0,
                      child: CircularProgressIndicator(
                        color: AppColors.WHITE_COLOR,
                        strokeWidth: 2.0,
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
