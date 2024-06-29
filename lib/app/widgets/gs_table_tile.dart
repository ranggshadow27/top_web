import 'package:flutter/material.dart';

import '../utils/themes/colors.dart';
import '../utils/themes/text_styles.dart';

class GsTableTile extends StatelessWidget {
  const GsTableTile({
    super.key,
    required this.name,
    required this.total,
    required this.status,
    required this.created,
  });

  final String name, status, total, created;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      decoration: const BoxDecoration(
          color: AppColors.primaryBackground,
          border: BorderDirectional(
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
              name,
              style: CustomTextStyle.mediumText.copyWith(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: width * 0.12,
            child: Text(
              total,
              style: CustomTextStyle.mediumText.copyWith(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: width * 0.15,
            child: Text(
              created,
              style: CustomTextStyle.mediumText.copyWith(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              status,
              style: CustomTextStyle.mediumText.copyWith(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              ":",
              textAlign: TextAlign.right,
              style: CustomTextStyle.mediumText.copyWith(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
