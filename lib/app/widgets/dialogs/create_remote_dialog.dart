import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:teleglobal_operate/app/modules/provision/controllers/provision_content_controller.dart';

import '../../utils/themes/colors.dart';
import '../../utils/themes/text_styles.dart';
import '../custom_elebutton.dart';
import '../top_textfield.dart';

class CreateRemoteDialog extends StatelessWidget {
  const CreateRemoteDialog({
    required this.controller,
    super.key,
  });

  final ProvisionContentController controller;

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
                "Create New Site",
                style: CustomTextStyle.semiBoldText.copyWith(fontSize: 16.0),
              ),
              const SizedBox(height: 12),
              TopTextfield(
                hintText: "Site Name",
                isPassword: false,
                textController: controller.newRemoteTC,
              ),
              const SizedBox(height: 12),
              TopTextfield(
                hintText: "Latitude",
                isPassword: false,
                textController: controller.latTC,
              ),
              const SizedBox(height: 12),
              TopTextfield(
                hintText: "Longitude",
                isPassword: false,
                textController: controller.longTC,
              ),
              const SizedBox(height: 12),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                ),
                asyncItems: (data) => controller.getGSData(),
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
              const SizedBox(height: 12),
              CustomElebutton(onTap: controller.addRemote, title: "Create")
            ],
          ),
        ),
      ),
    );
  }
}
