import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/themes/colors.dart';
import '../utils/themes/text_styles.dart';

class TopTextfield extends StatelessWidget {
  const TopTextfield({
    required this.hintText,
    required this.iconData,
    required this.isPassword,
    required this.textController,
    super.key,
  });

  final String hintText;
  final IconData iconData;
  final bool isPassword;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      autocorrect: false,
      maxLines: 1,
      keyboardType: isPassword ? TextInputType.text : TextInputType.emailAddress,
      obscureText: isPassword,
      style: CustomTextStyle.mediumText.copyWith(fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: CustomTextStyle.mediumText.copyWith(
          fontSize: 14,
          color: AppColors.blackFont.withOpacity(.5),
        ),
        prefixIcon: SizedBox(
          width: 50,
          child: Center(
            child: FaIcon(
              iconData,
              color: AppColors.orangeAccent,
              size: 18,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.primaryBackground,
      ),
    );
  }
}
