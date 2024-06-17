import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/modules/controllers/page_controller.dart';
import 'package:teleglobal_operate/app/widgets/navigation_tile.dart';

import '../utils/themes/colors.dart';

class NavigationView extends GetView {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppPageController());
    RxDouble width = 0.0.obs;

    return Container(
      height: Get.height,
      width: 220,
      decoration: const BoxDecoration(
        color: AppColors.primaryBackground,
        border: Border(
          right: BorderSide(color: AppColors.borderColor, width: 2),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.menuData.length,
            itemBuilder: (context, index) => GetBuilder<AppPageController>(
              builder: (controller) => NavigationTile(
                icon: controller.menuData[index]['icon'],
                title: controller.menuData[index]['title'],
                onTap: () {
                  controller.switchPage(index);
                  debugPrint("Selected Page : ${controller.selectedPage}");
                  debugPrint("itemIndex Page : ${controller.menuData[index]['itemIndex']}");
                  debugPrint("Title Page : ${controller.menuData[index]['title']}");
                },
                selectedItem: controller.selectedPage == controller.menuData[index]['itemIndex']
                    ? true
                    : false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
