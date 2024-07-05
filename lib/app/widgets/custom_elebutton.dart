import 'package:flutter/material.dart';

import '../utils/themes/colors.dart';
import '../utils/themes/text_styles.dart';

class CustomElebutton extends StatelessWidget {
  const CustomElebutton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          fixedSize: Size(MediaQuery.of(context).size.width, 45)),
      onPressed: onTap,
      child: Text(
        title,
        style: CustomTextStyle.semiBoldText.copyWith(
          color: AppColors.pureWhite,
          fontSize: 14,
        ),
      ),
    );
  }
}
