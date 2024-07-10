import 'package:flutter/material.dart';

import '../utils/themes/colors.dart';
import '../utils/themes/text_styles.dart';

class GsTableHeader extends StatelessWidget {
  const GsTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.blackFont.withOpacity(.03),
          border: const BorderDirectional(
            bottom: BorderSide(
              color: AppColors.borderColor,
              width: 2,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.25,
            child: Text(
              "Vendor Name",
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            width: width * 0.12,
            child: Text(
              "Total Remote",
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width * 0.15,
            child: Text(
              "Created",
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              "Status",
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              "Action",
              textAlign: TextAlign.right,
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
