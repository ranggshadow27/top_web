import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/sla/controllers/sla_controller.dart';
import '../utils/themes/colors.dart';
import '../utils/themes/text_styles.dart';

class SlaContainer extends StatelessWidget {
  const SlaContainer(
      {required this.description, required this.value, super.key});

  final String value, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width * .25,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 4),
            color: Color.fromARGB(8, 47, 46, 46),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$value %",
            style: CustomTextStyle.semiBoldText
                .copyWith(fontSize: 36, color: AppColors.orangeAccent),
          ),
          const SizedBox(height: 10),
          Text(
            "SLA $description",
            style: CustomTextStyle.mediumText.copyWith(
              color: AppColors.blackFont.withOpacity(.8),
            ),
          ),
        ],
      ),
    );
  }
}
