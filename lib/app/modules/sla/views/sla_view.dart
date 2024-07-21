import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';

import '../../../utils/themes/text_styles.dart';
import '../controllers/sla_controller.dart';

class SlaView extends GetView<SlaController> {
  const SlaView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SlaController>(
      () => SlaController(),
    );

    return ListView(
      children: [
        const SizedBox(height: 200),
        Expanded(
          child: GetBuilder<SlaController>(
            builder: (c) => Table(
              // border: TableBorder.all(color: Colors.black),
              columnWidths: const {
                0: FlexColumnWidth(3),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBackground,
                    border: Border(
                      bottom:
                          BorderSide(color: AppColors.borderColor, width: 2),
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
                            "TEST",
                            style: CustomTextStyle.mediumText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                  c.data.length,
                  (index) {
                    return TableRow(
                      decoration: BoxDecoration(
                        color: c.data[index]['isHeader']
                            ? AppColors.blackFont.withOpacity(.03)
                            : AppColors.primaryBackground,
                        border: const Border(
                          bottom: BorderSide(
                              color: AppColors.borderColor, width: 2),
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
                                style: controller.data[index]['isHeader']
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
