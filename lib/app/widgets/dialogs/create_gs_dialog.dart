import 'package:flutter/material.dart';
import 'package:teleglobal_operate/app/modules/provision/controllers/provision_content_controller.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';
import 'package:teleglobal_operate/app/widgets/custom_elebutton.dart';
import 'package:teleglobal_operate/app/widgets/top_textfield.dart';

class CreateGSDialog extends StatelessWidget {
  const CreateGSDialog({
    super.key,
    required this.controller,
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
                "Create New GS Vendor",
                style: CustomTextStyle.semiBoldText.copyWith(fontSize: 16.0),
              ),
              const SizedBox(height: 12),
              TopTextfield(
                hintText: "Vendor Name",
                isPassword: false,
                textController: controller.gsTC,
              ),
              const SizedBox(height: 12),
              CustomElebutton(
                  onTap: () async {
                    await controller.addGSVendor();
                  },
                  title: "Create")
            ],
          ),
        ),
      ),
    );
  }
}
