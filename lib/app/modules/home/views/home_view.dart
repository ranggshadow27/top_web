import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/navigation_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBackground,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColors.borderColor,
            ),
          ),
          title: Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.solidGem,
                color: AppColors.orangeAccent,
              ),
              const SizedBox(width: 10),
              Text(
                "Teleglobal",
                style: CustomTextStyle.semiBoldText,
              ),
              const SizedBox(width: 4),
              Text(
                "Operate App",
                style: CustomTextStyle.mediumText.copyWith(
                  color: AppColors.blackFont.withOpacity(.5),
                ),
              ),
              const Spacer(),
              Text(
                "Nico Robin",
                style: CustomTextStyle.semiBoldText,
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.redAccent.withOpacity(.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: AppColors.redAccent,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Row(
          children: [
            NavigationView(),
          ],
        ));
  }
}
