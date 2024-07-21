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

    for (var i = 1; i < vendorData.length + 1; i++) {
      // debugPrint("INI DATA 2 NYA : ${data[i]}");

      for (var z = 1; z < now; z++) {
        data[i]['data'][z] = '${randomizeDouble()} %';
        // debugPrint("INDEX ke $z DATANYA : ${data[i]['data'][z]}");
      }
    }

    return data;
  }
}

double randomizeDouble() {
  double num = 88 + Random().nextDouble() * (100.0 - 88.0);

  return double.parse(num.toStringAsFixed(1));
}
