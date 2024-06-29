import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/navigation_view.dart';

import '../../controllers/page_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final c = Get.put(AppPageController());
    RxDouble width = 0.0.obs;

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
            FutureBuilder<DocumentSnapshot>(
              future: controller.getUserCredential(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }

                if (snapshot.hasData) {
                  var userData = snapshot.data!.data() as Map<String, dynamic>;

                  return Text(
                    userData['username'],
                    style: CustomTextStyle.semiBoldText,
                  );
                }

                return Text(
                  "Anonymous",
                  style: CustomTextStyle.semiBoldText,
                );
              },
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () => controller.logout(),
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
      body: Obx(
        () {
          width.value = MediaQuery.of(context).size.width;
          return SizedBox(
            width: width.value,
            child: Row(
              children: [
                const NavigationView(),
                Expanded(
                  child: Center(
                    child: GetBuilder<AppPageController>(
                      builder: (controller) => controller.switchPages(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
