import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
      'title': 'Summary SLA',
      'icon': FontAwesomeIcons.paperclip,
      'itemIndex': 1,
    },
    {
      'title': 'Performance',
      'icon': FontAwesomeIcons.cloudscale,
      'itemIndex': 2,
    },
    {
      'title': 'Report',
      'icon': FontAwesomeIcons.book,
      'itemIndex': 3,
    },
  ];

  switchPage(int index) {
    selectedPage = index;

    update();
  }

  Widget switchPages() {
    switch (selectedPage) {
      case 0:
        return Text("Menu ke $selectedPage");
      case 1:
        return Text("Menu ke $selectedPage");
      case 2:
        return Text("Menu ke $selectedPage");
      case 3:
        return Text("Menu ke $selectedPage");

      default:
        return const Text("Menu Kosong");
    }
  }
}
