import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:teleglobal_operate/app/modules/report/controllers/report_controller.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/custom_elebutton.dart';
import 'package:teleglobal_operate/app/widgets/top_textfield.dart';

import '../../utils/themes/colors.dart';

class EditCriteriaDialog extends StatelessWidget {
  const EditCriteriaDialog({
    super.key,
    required this.controller,
    required this.onTap,
  });

  final ReportController controller;
  final VoidCallback onTap;

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
                "Update Report Criteria",
                style: CustomTextStyle.semiBoldText.copyWith(fontSize: 16.0),
              ),
              const SizedBox(height: 12),
              TopTextfield(
                hintText: "Criteria Name",
                isPassword: false,
                textController: controller.criteriaTC,
              ),
              const SizedBox(height: 12),
              TopTextfield(
                hintText: "Value",
                isPassword: false,
                textController: controller.valueTC,
              ),
              const SizedBox(height: 12),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                ),
                items: const ["Quality", "Services"],
                selectedItem:
                    controller.criteriaType.value == "" ? null : controller.criteriaType.value,
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
                    hintText: "Select Criteria Type",
                    hintStyle: CustomTextStyle.mediumText.copyWith(
                      fontSize: 14,
                      color: AppColors.blackFont.withOpacity(.5),
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value != null) {
                    controller.criteriaType.value = value;
                  }
                },
              ),
              const SizedBox(height: 12),
              CustomElebutton(onTap: onTap, title: "Update")
            ],
          ),
        ),
      ),
    );
  }
}
