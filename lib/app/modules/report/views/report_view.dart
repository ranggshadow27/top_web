import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/dialogs/create_gs_dialog.dart';
import 'package:teleglobal_operate/app/widgets/dialogs/create_report_criteria.dart';
import 'package:teleglobal_operate/app/widgets/dialogs/edit_report_criteria.dart';

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
                    c.valueTC.clear();
                    c.criteriaTC.clear();

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
              0: FlexColumnWidth(1),
              2: FlexColumnWidth(5),
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
                              vertical: dataFC[index]['isHeader'] ? 12 : 6,
                            ),
                            child: dataFC[index]['data'][cellIndex] != ''
                                ? Text(
                                    dataFC[index]['data'][cellIndex],
                                    textAlign: cellIndex != 2 && cellIndex != 0
                                        ? TextAlign.center
                                        : TextAlign.left,
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
                                      onTap: () async {
                                        c.valueTC.clear();
                                        c.criteriaTC.clear();

                                        c.criteriaTC.text = dataFC[index]['data'][2];
                                        c.valueTC.text = '${dataFC[index]['data'][cellIndex - 1]}';
                                        c.criteriaType.value = '${dataFC[index]['data'][0]}';

                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return EditCriteriaDialog(
                                              controller: controller,
                                              onTap: () async {
                                                await c.updateReportCriteria('K$index');
                                              },
                                            );
                                          },
                                        );
                                      },
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
