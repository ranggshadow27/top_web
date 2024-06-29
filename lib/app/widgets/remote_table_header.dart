import 'package:flutter/material.dart';

import '../utils/themes/colors.dart';
import '../utils/themes/text_styles.dart';

class RemoteTableHeader extends StatelessWidget {
  const RemoteTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
            width: width * 0.2,
            child: Text(
              "Site Name",
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              "GS",
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            width: width * 0.12,
            child: Text(
              "Latitude",
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            width: width * 0.12,
            child: Text(
              "Longitude",
              style: CustomTextStyle.boldText.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            width: width * 0.12,
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
