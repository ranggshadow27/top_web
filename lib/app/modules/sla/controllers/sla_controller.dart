import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SlaController extends GetxController {
  //TODO: Implement SlaController

  @override
  void onInit() async {
    super.onInit();
    await getVendorData();

    update();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final now = int.parse(DateFormat('M').format(DateTime.now())) + 1;

  final List<Map<String, dynamic>> data = [
    {
      'data': [
        'Vendor',
        'JAN',
        'FEB',
        'MAR',
        'APR',
        'MAY',
        'JUN',
        'JUL',
        'AUG',
        'SEP',
        'OCT',
        'NOV',
        'DEC',
      ],
      'isHeader': true,
    },
  ];

  Future<List<Map<String, dynamic>>> getVendorData() async {
    QuerySnapshot query =
        await firestore.collection('gs_data').orderBy('createdAt').get();

    List<String> vendorData =
        query.docs.map((e) => e['gsName'] as String).toList();

    for (var i = 0; i < vendorData.length; i++) {
      data.add({
        'data': [
          vendorData[i],
          '-',
          '-',
          '-',
          '-',
          '-',
          '-',
          '-',
          '-',
          '-',
          '-',
          '-',
          '-',
        ],
        'isHeader': false,
      });
    }

    debugPrint("$data");

    for (var vendorIndex = 1;
        vendorIndex < vendorData.length + 1;
        vendorIndex++) {
      // debugPrint("INI DATA 2 NYA : ${data[i]}");

      for (var valueIndex = 1; valueIndex < now; valueIndex++) {
        data[vendorIndex]['data'][valueIndex] =
            '${randomizeDouble(valueIndex, vendorIndex)} %';
        // debugPrint("INDEX ke $z DATANYA : ${data[i]['data'][z]}");
      }
    }

    return data;
  }
}

double randomizeDouble(int valueIndex, vendorIndex) {
  double num = 0;

  if (valueIndex == 4 && vendorIndex == 4) {
    num = 85 + Random().nextDouble() * (95.0 - 85.0);
  } else if (valueIndex == 3 && vendorIndex == 5) {
    num = 85 + Random().nextDouble() * (95.0 - 85.0);
  } else if (valueIndex == 2 && vendorIndex == 6) {
    num = 85 + Random().nextDouble() * (95.0 - 85.0);
  } else {
    num = 98 + Random().nextDouble() * (100.0 - 98.0);
  }

  return double.parse(num.toStringAsFixed(1));
}
