import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/custom_button.dart';
import 'package:teleglobal_operate/app/widgets/dialogs/create_gs_dialog.dart';
import 'package:teleglobal_operate/app/widgets/dialogs/create_remote_dialog.dart';
import 'package:teleglobal_operate/app/widgets/gs_table_header.dart';
import 'package:teleglobal_operate/app/widgets/gs_table_tile.dart';
import 'package:teleglobal_operate/app/widgets/remote_table_header.dart';
import 'package:teleglobal_operate/app/widgets/remote_table_tile.dart';

import '../controllers/provision_content_controller.dart';

class ProvisionContentView extends GetView<ProvisionContentController> {
  const ProvisionContentView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProvisionContentController>(
      () => ProvisionContentController(),
    );

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Obx(() {
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
                  color: controller.indexActive.value == 0
                      ? AppColors.orangeAccent
                      : AppColors.pureWhite,
                  titleColor: controller.indexActive.value == 0 ? AppColors.pureWhite : null,
                  title: "Remote",
                  onTap: () => controller.switchToRemoteData(),
                ),
                const SizedBox(width: 8),
                RButton(
                  color: controller.indexActive.value == 1
                      ? AppColors.orangeAccent
                      : AppColors.pureWhite,
                  titleColor: controller.indexActive.value == 1 ? AppColors.pureWhite : null,
                  title: "Vendor GS",
                  onTap: () => controller.switchToGSData(),
                ),
                const Spacer(),
                RButton(
                  color: AppColors.orangeAccent,
                  title: "Create New",
                  titleColor: AppColors.primaryBackground,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        if (controller.indexActive.value == 1) {
                          return CreateGSDialog(
                            controller: controller,
                          );
                        }
                        return const CreateRemoteDialog();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            width: width,
            height: height * .8,
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
                controller.indexActive.value == 0
                    ? const RemoteTableHeader()
                    : const GsTableHeader(),
                Column(
                  children: List.generate(
                    10,
                    (index) => controller.indexActive.value == 0
                        ? const RemoteTableTile(
                            name: "SMP Negeri 1 Long Bagun",
                            gs: "IPT",
                            lat: "-1.4032333333333336",
                            long: "115.15176666666666",
                            status: "Active",
                            created: "30 December 2024 15:14",
                          )
                        : const GsTableTile(
                            name: "PT. Pasifik Satelit Nusantara",
                            total: "134",
                            status: "Active",
                            created: "30 September 2024 15:14",
                          ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
