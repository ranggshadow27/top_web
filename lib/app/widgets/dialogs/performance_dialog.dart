import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:teleglobal_operate/app/modules/performance/controllers/performance_controller.dart';
import 'package:teleglobal_operate/app/modules/provision/controllers/provision_content_controller.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/custom_elebutton.dart';
import 'package:teleglobal_operate/app/widgets/top_textfield.dart';

import '../../utils/themes/colors.dart';

class PerformanceDialog extends StatelessWidget {
  const PerformanceDialog({
    super.key,
    required this.controller,
  });

  final PerformanceController controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(25),
          width: 200,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add New Performance",
                style: CustomTextStyle.semiBoldText.copyWith(fontSize: 16.0),
              ),
              const SizedBox(height: 12),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                ),
                asyncItems: (data) => controller.getVendorData(),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: CustomTextStyle.mediumText.copyWith(
                    fontSize: 14,
                    color: AppColors.blackFont,
                    overflow: TextOverflow.ellipsis,
                  ),
                  dropdownSearchDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors.primaryBackground,
                    hintText: "Select GS",
                    hintStyle: CustomTextStyle.mediumText.copyWith(
                      fontSize: 14,
                      color: AppColors.blackFont.withOpacity(.5),
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedGS.value = value;
                  }
                },
              ),
              const SizedBox(height: 8),
              ...List.generate(
                controller.data[0]['data'].length - 3,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TopTextfield(
                    hintText: "K${index + 1}",
                    isPassword: false,
                    textController: controller.dynamicTC[index],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CustomElebutton(
                  onTap: () async {
                    await controller.addVendorPeformance();
                  },
                  title: "Create")
            ],
          ),
        ),
      ),
    );
  }
}
