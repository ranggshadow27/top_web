import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:teleglobal_operate/app/modules/provision/views/provision_content_view.dart';
import 'package:teleglobal_operate/app/modules/home/views/home_content_view.dart';
import 'package:teleglobal_operate/app/modules/report/views/report_view.dart';
import 'package:teleglobal_operate/app/modules/sla/views/sla_view.dart';

class AppPageController extends GetxController {
  //TODO: Implement PageControllerController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int selectedPage = 0;

  final List<Map<String, dynamic>> menuData = [
    {
      'title': 'Home',
      'icon': FontAwesomeIcons.house,
      'itemIndex': 0,
    },
    {
      'title': 'Provision',
      'icon': FontAwesomeIcons.satelliteDish,
      'itemIndex': 1,
    },
    {
      'title': 'Summary SLA',
      'icon': FontAwesomeIcons.paperclip,
      'itemIndex': 2,
    },
    {
      'title': 'Performance',
      'icon': FontAwesomeIcons.cloudscale,
      'itemIndex': 3,
    },
    {
      'title': 'Report',
      'icon': FontAwesomeIcons.book,
      'itemIndex': 4,
    },
  ];

  switchPage(int index) {
    selectedPage = index;

    update();
  }

  Widget switchPages() {
    switch (selectedPage) {
      case 0:
        return const HomeContentView();
      case 1:
        return const ProvisionContentView();
      case 2:
        return const SlaView();
      case 3:
        return Text("Menu ke $selectedPage");
      case 4:
        return const ReportView();

      default:
        return const Text("Menu Kosong");
    }
  }
}
