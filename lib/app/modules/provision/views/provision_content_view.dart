import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:teleglobal_operate/app/utils/date_format.dart';
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

    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Obx(() {
      return ListView(
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
                  titleColor: controller.indexActive.value == 0
                      ? AppColors.pureWhite
                      : null,
                  title: "Remote",
                  onTap: () => controller.switchToRemoteData(),
                ),
                const SizedBox(width: 8),
                RButton(
                  color: controller.indexActive.value == 1
                      ? AppColors.orangeAccent
                      : AppColors.pureWhite,
                  titleColor: controller.indexActive.value == 1
                      ? AppColors.pureWhite
                      : null,
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
                        return CreateRemoteDialog(
                          controller: controller,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryBackground,
            ),
            child: Column(
              children: [
                controller.indexActive.value == 0
                    ? const RemoteTableHeader()
                    : const GsTableHeader(),
                GetBuilder<ProvisionContentController>(
                  builder: (controller) => FutureBuilder(
                    future: controller.indexActive.value == 0
                        ? controller.getQueryRemoteData()
                        : controller.getQueryGSData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return const Text("Something went wrong");
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      List<DocumentSnapshot> data = snapshot.data!.docs;

                      return controller.indexActive.value == 0
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) => RemoteTableTile(
                                name: data[index]['remoteName'],
                                gs: data[index]['gsVendor'],
                                lat: data[index]['lat'],
                                long: data[index]['long'],
                                status: "Active",
                                created: CustomDateFormat.formatTodMMYYYhhmm(
                                  data[index]['createdAt'],
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) => GsTableTile(
                                name: data[index]['gsName'],
                                total: data[index]['totalRemote'].toString(),
                                status: "Active",
                                created: CustomDateFormat.formatToDDMMYYYhhmm(
                                  data[index]['createdAt'],
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
