import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/dialogs/create_report_criteria.dart';

import '../../../widgets/custom_button.dart';
import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ReportController>(
      () => ReportController(),
    );

    return GetBuilder<ReportController>(
      builder: (c) => ListView(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  "Report Summary",
                  style: CustomTextStyle.boldText.copyWith(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                RButton(
                  color: AppColors.orangeAccent,
                  title: "Create New Criteria",
                  titleColor: AppColors.primaryBackground,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return CreateReportCriteriaDialog(
                          controller: controller,
                        );
                      },
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
              2: FlexColumnWidth(3),
            },
            children: [
              ...List.generate(
                c.data.length,
                (index) {
                  return TableRow(
                    decoration: BoxDecoration(
                      color: c.data[index]['isHeader']
                          ? AppColors.blackFont.withOpacity(.03)
                          : AppColors.primaryBackground,
                      border: Border(
                        bottom: const BorderSide(
                            color: AppColors.borderColor, width: 2),
                        top: BorderSide(
                            color: AppColors.borderColor,
                            width: c.data[index]['isHeader'] ? 2 : 0),
                      ),
                    ),
                    children: [
                      ...List.generate(
                        c.data[index]['data'].length,
                        (cellIndex) => TableCell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            child: Text(
                              c.data[index]['data'][cellIndex],
                              style: c.data[index]['isHeader']
                                  ? CustomTextStyle.boldText
                                      .copyWith(fontSize: 16)
                                  : CustomTextStyle.mediumText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              TableRow(
                decoration: const BoxDecoration(
                  color: AppColors.primaryBackground,
                  border: Border(
                    bottom: BorderSide(color: AppColors.borderColor, width: 2),
                  ),
                ),
                children: [
                  ...List.generate(
                    c.data[0]['data'].length,
                    (cellIndex) => TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        child: Text(
                          "controller.grandTotalData[cellIndex]",
                          style: CustomTextStyle.mediumText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
