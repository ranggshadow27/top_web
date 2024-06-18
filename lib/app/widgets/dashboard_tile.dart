import 'package:flutter/material.dart';
import 'package:teleglobal_operate/app/utils/themes/text_styles.dart';

import '../utils/themes/colors.dart';

class DashboardTile extends StatelessWidget {
  DashboardTile({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.data,
    required this.description,
  });

  final double height;
  final double width;

  final String title, data, description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        height: height * .16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryBackground,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width * .15,
              child: Text(
                title,
                style: CustomTextStyle.mediumText.copyWith(
                  color: AppColors.blackFont.withOpacity(.5),
                  fontSize: 14.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Text(
              data,
              style: CustomTextStyle.semiBoldText.copyWith(
                color: AppColors.orangeAccent,
                fontSize: 36,
              ),
            ),
            SizedBox(
              width: width * .15,
              child: Text(
                description,
                style: CustomTextStyle.mediumText.copyWith(
                  color: AppColors.blackFont.withOpacity(.5),
                  fontSize: 14.0,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
