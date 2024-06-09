import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../utils/themes/colors.dart';
import '../utils/themes/text_styles.dart';

class NavigationTile extends StatelessWidget {
  const NavigationTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.selectedItem,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Material(
        shadowColor: Colors.black.withOpacity(.25),
        elevation: selectedItem ? 2 : 0,
        type: MaterialType.button,
        color: selectedItem ? AppColors.pureWhite : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: Get.width * .16,
            child: Row(
              children: [
                FaIcon(icon, size: 18),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: CustomTextStyle.semiBoldText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
