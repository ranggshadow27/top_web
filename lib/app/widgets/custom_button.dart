import 'package:flutter/material.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';

class RButton extends StatelessWidget {
  RButton({
    super.key,
    required this.color,
    required this.title,
    required this.onTap,
    this.paddingH,
    this.paddingV,
    this.titleColor,
  });

  final VoidCallback onTap;
  final String title;
  final Color color;
  Color? titleColor;
  double? paddingH, paddingV;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: color,
      elevation: 4,
      shadowColor: AppColors.blackFont.withOpacity(.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: paddingH ?? 20,
            vertical: paddingV ?? 8,
          ),
          child: Text(
            title,
            style: CustomTextStyle.mediumText.copyWith(
              color: titleColor ?? AppColors.blackFont,
            ),
          ),
        ),
      ),
    );
  }
}
