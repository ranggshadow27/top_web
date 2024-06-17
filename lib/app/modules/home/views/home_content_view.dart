import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teleglobal_operate/app/modules/home/controllers/home_controller.dart';
import 'package:teleglobal_operate/app/utils/themes/colors.dart';
import 'package:teleglobal_operate/app/widgets/dashboard_tile.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: width,
          height: height * .42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
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
          child: Center(
            child: Text("MAP ${controller.pageIndex}"),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            DashboardTile(
              height: height,
              width: width,
              title: "Site Up",
              data: "420",
              description: "Total Site 420/520",
            ),
            const SizedBox(width: 16),
            DashboardTile(
              height: height,
              width: width,
              title: "Site Down",
              data: "80",
              description: "Total Site 80/520",
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            DashboardTile(
              height: height,
              width: width,
              title: "Trouble Ticket Open",
              data: "87",
              description: DateTime.now().toIso8601String(),
            ),
            const SizedBox(width: 16),
            DashboardTile(
              height: height,
              width: width,
              title: "SLA Monthly",
              data: "98 %",
              description: DateTime.now().toIso8601String(),
            ),
          ],
        )
      ],
    );
  }
}
