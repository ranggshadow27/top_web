import 'package:flutter/material.dart';

import '../../utils/themes/text_styles.dart';
import '../custom_elebutton.dart';
import '../top_textfield.dart';

class CreateRemoteDialog extends StatelessWidget {
  const CreateRemoteDialog({super.key});

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
                textController: TextEditingController(),
              ),
              const SizedBox(height: 12),
              TopTextfield(
                hintText: "Latitude",
                isPassword: false,
                textController: TextEditingController(),
              ),
              const SizedBox(height: 12),
              TopTextfield(
                hintText: "Longitude",
                isPassword: false,
                textController: TextEditingController(),
              ),
              const SizedBox(height: 12),
              CustomElebutton(onTap: () {}, title: "Create")
            ],
          ),
        ),
      ),
    );
  }
}
