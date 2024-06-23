import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/custom_button.dart';

import '../controllers/provision_content_controller.dart';

class ProvisionContentView extends GetView<ProvisionContentController> {
  const ProvisionContentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Text(
                "Master Data",
                style: CustomTextStyle.boldText.copyWith(
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 20),
              RButton(
                color: AppColors.pureWhite,
                title: "Remote",
                onTap: () {},
              ),
              const SizedBox(width: 8),
              RButton(
                color: AppColors.pureWhite,
                title: "Vendor GS",
                onTap: () {},
              ),
              const Spacer(),
              RButton(
                color: AppColors.orangeAccent,
                title: "Create New",
                titleColor: AppColors.primaryBackground,
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
