import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:teleglobal_operate/app/modules/login/controllers/login_controller.dart';

import '../../utils/themes/colors.dart';
import '../../utils/themes/text_styles.dart';
import '../top_textfield.dart';

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController(), permanent: true);

    return Dialog(
      child: Container(
        padding: EdgeInsets.all(28),
        width: MediaQuery.of(context).size.width * .25,
        height: 260,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forgot Password",
              style: CustomTextStyle.semiBoldText.copyWith(fontSize: 22),
            ),
            Text(
              "We will send you link to reset your account password.  ",
              textAlign: TextAlign.center,
              style: CustomTextStyle.regularText.copyWith(
                fontSize: 14,
                color: AppColors.blackFont.withOpacity(.5),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            TopTextfield(
              hintText: "Email",
              textController: controller.emailTC,
              iconData: FontAwesomeIcons.solidEnvelope,
              isPassword: false,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width, 45),
              ),
              onPressed: () {},
              child: Text(
                "Reset your Password",
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
