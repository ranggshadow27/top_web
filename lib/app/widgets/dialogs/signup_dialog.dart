import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/themes/colors.dart';
import '../../utils/themes/text_styles.dart';
import '../top_textfield.dart';

class SignupDialog extends StatelessWidget {
  const SignupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 380,
        width: MediaQuery.of(context).size.width * .25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: CustomTextStyle.semiBoldText.copyWith(fontSize: 22),
            ),
            Text(
              "Register your account before continue.  ",
              style: CustomTextStyle.regularText.copyWith(
                fontSize: 14,
                color: AppColors.blackFont.withOpacity(.5),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const TopTextfield(
              hintText: "Email",
              iconData: FontAwesomeIcons.solidEnvelope,
              isPassword: false,
            ),
            const SizedBox(height: 14),
            const TopTextfield(
              hintText: "Password",
              iconData: FontAwesomeIcons.key,
              isPassword: true,
            ),
            const SizedBox(height: 14),
            const TopTextfield(
              hintText: "Confirm Password",
              iconData: FontAwesomeIcons.key,
              isPassword: true,
            ),
            const SizedBox(height: 26),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width, 45)),
              onPressed: () {},
              child: Text(
                "Sign Up",
                style: CustomTextStyle.semiBoldText.copyWith(
                  color: AppColors.pureWhite,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
