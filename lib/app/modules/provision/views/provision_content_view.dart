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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
        ),
        Container(
          width: width,
          height: height * .7,
          decoration: const BoxDecoration(
            color: AppColors.secondaryBackground,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: AppColors.borderColor,
                width: 2,
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: width,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                    color: AppColors.blackFont.withOpacity(.03),
                    border: const BorderDirectional(
                      bottom: BorderSide(
                        color: AppColors.borderColor,
                        width: 2,
                      ),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Text(
                        "Site Name",
                        style: CustomTextStyle.boldText.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        "GS",
                        style: CustomTextStyle.boldText.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.12,
                      child: Text(
                        "Latitude",
                        style: CustomTextStyle.boldText.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.12,
                      child: Text(
                        "Longitude",
                        style: CustomTextStyle.boldText.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.12,
                      child: Text(
                        "Created",
                        style: CustomTextStyle.boldText.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                        "Status",
                        style: CustomTextStyle.boldText.copyWith(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        "Action",
                        textAlign: TextAlign.right,
                        style: CustomTextStyle.boldText.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                decoration: const BoxDecoration(
                    color: AppColors.primaryBackground,
                    border: BorderDirectional(
                      bottom: BorderSide(
                        color: AppColors.borderColor,
                        width: 2,
                      ),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.2,
                      child: Text(
                        "SMP Negeri 1 Long Bagun",
                        style: CustomTextStyle.mediumText.copyWith(),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        "IPT",
                        style: CustomTextStyle.mediumText.copyWith(),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.12,
                      child: Text(
                        "-1.4032333333333336",
                        style: CustomTextStyle.mediumText.copyWith(),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.12,
                      child: Text(
                        "115.15176666666666",
                        style: CustomTextStyle.mediumText.copyWith(),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.12,
                      child: Text(
                        "30 December 2024 15:14",
                        style: CustomTextStyle.mediumText.copyWith(),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                        "Active",
                        style: CustomTextStyle.mediumText.copyWith(),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        ":",
                        textAlign: TextAlign.right,
                        style: CustomTextStyle.mediumText.copyWith(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
