import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/widgets/dialogs/performance_dialog.dart';

import '../../../utils/themes/colors.dart';
import '../../../utils/themes/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../controllers/performance_controller.dart';

class PerformanceView extends GetView<PerformanceController> {
  const PerformanceView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PerformanceController>(
      () => PerformanceController(),
    );

    return GetBuilder<PerformanceController>(
      builder: (c) => ListView(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  "Vendor Performance",
                  style: CustomTextStyle.boldText.copyWith(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                RButton(
                  color: AppColors.orangeAccent,
                  title: "Add",
                  titleColor: AppColors.primaryBackground,
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => PerformanceDialog(controller: controller),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Table(
            // border: TableBorder.all(color: Colors.black),

            columnWidths: const {
              1: FlexColumnWidth(2),
            },
            children: [
              ...List.generate(
                c.data.length,
                (index) {
                  List dataFC = c.data;

                  return TableRow(
                    decoration: BoxDecoration(
                      color: dataFC[index]['isHeader']
                          ? AppColors.blackFont.withOpacity(.03)
                          : AppColors.primaryBackground,
                      border: Border(
                        bottom: const BorderSide(color: AppColors.borderColor, width: 2),
                        top: BorderSide(
                          color: AppColors.borderColor,
                          width: dataFC[index]['isHeader'] ? 2 : 0,
                        ),
                      ),
                    ),
                    children: [
                      ...List.generate(
                        dataFC[index]['data'].length,
                        (cellIndex) => TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: dataFC[index]['isHeader'] ? 12 : 10,
                            ),
                            child: dataFC[index]['data'][cellIndex] != ''
                                ? Text(
                                    dataFC[index]['data'][cellIndex],
                                    textAlign: cellIndex != 1 ? TextAlign.center : TextAlign.left,
                                    style: dataFC[index]['isHeader']
                                        ? CustomTextStyle.boldText.copyWith(fontSize: 16)
                                        : CustomTextStyle.mediumText,
                                  )
                                : Center(
                                    child: RButton(
                                      // paddingV: 8,
                                      color: AppColors.orangeAccent,
                                      title: "Edit",
                                      titleColor: AppColors.primaryBackground,
                                      onTap: () async {},
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
