import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width,
    this.height,
    required this.buttonText,
    this.enableGradient = true,
    this.radius = 10,
    this.fontSize,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? fontSize;
  final double radius;
  final String buttonText;

  final bool enableGradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: enableGradient
              ? null
              : Border.all(color: AppColors.buttonBorderColor),
          gradient: enableGradient
              ? const LinearGradient(
                  colors: [
                    AppColors.selectedTabTextColor,
                    AppColors.buttonGradientColor
                  ],
                )
              : null,
        ),
        child: Center(
            child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: enableGradient
                  ? Colors.white
                  : AppColors.selectedTabTextColor,
              fontSize: fontSize),
        )),
      ),
    );
  }
}
