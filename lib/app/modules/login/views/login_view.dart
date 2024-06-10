import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/top_textfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: AppColors.primaryBackground,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(FontAwesomeIcons.solidGem,
                    color: AppColors.orangeAccent, size: 60),
                const SizedBox(height: 40),
                Text(
                  "Teleglobal Operate",
                  style: CustomTextStyle.semiBoldText
                      .copyWith(fontSize: 28, color: AppColors.blackFont),
                ),
                Text(
                  "Application",
                  style: CustomTextStyle.semiBoldText
                      .copyWith(fontSize: 28, color: AppColors.orangeAccent),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.pureWhite,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .15),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back.",
                  style: CustomTextStyle.semiBoldText.copyWith(fontSize: 22),
                ),
                Text(
                  "Please login or register to continue ",
                  style: CustomTextStyle.regularText.copyWith(
                    fontSize: 14,
                    color: AppColors.blackFont.withOpacity(.5),
                  ),
                ),
                const SizedBox(height: 38),
                const TopTextfield(
                  hintText: "Email",
                  iconData: FontAwesomeIcons.solidEnvelope,
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                const TopTextfield(
                  hintText: "Password",
                  iconData: FontAwesomeIcons.key,
                  isPassword: true,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot your password?",
                      style: CustomTextStyle.semiBoldText.copyWith(
                        color: AppColors.orangeAccent,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width, 45)),
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: CustomTextStyle.semiBoldText.copyWith(
                      color: AppColors.pureWhite,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have any account?",
                      style: CustomTextStyle.mediumText.copyWith(
                        color: AppColors.blackFont.withOpacity(.5),
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: CustomTextStyle.boldText.copyWith(
                        color: AppColors.orangeAccent,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
