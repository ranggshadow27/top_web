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

    slaDaily = randomizeDouble(0, 0);
    slaQuarterly = getSlaQuarterly();
    slaMonthly = getSlaMonthly();

    update();

    Future.delayed(
      const Duration(seconds: 30),
      () {
        slaDaily = randomizeDouble(0, 0);

        update();
      },
    );
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  double slaDaily = 0.0;
  double slaMonthly = 0.0;
  double slaQuarterly = 0.0;

  double initialTotal = 0.0;
  double initialSLATotal = 0.0;

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
        'TOTAL',
      ],
      'isHeader': true,
    },
  ];

  final List<String> grandTotalData = [
    'Grand Total SLA',
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
    '-',
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
          '-',
        ],
        'isHeader': false,
      });
    }

    debugPrint("$data");

    try {
      for (var vendorIndex = 1;
          vendorIndex < vendorData.length + 1;
          vendorIndex++) {
        // debugPrint("INI DATA 2 NYA : ${data[i]}");

        for (var valueIndex = 1; valueIndex < now; valueIndex++) {
          data[vendorIndex]['data'][valueIndex] =
              '${randomizeDouble(valueIndex, vendorIndex)} %';
          // debugPrint("INDEX ke $z DATANYA : ${data[i]['data'][z]}");

          initialTotal +=
              double.parse(data[vendorIndex]['data'][valueIndex].split(" ")[0]);
        }

        data[vendorIndex]['data'][13] =
            "${(initialTotal / (now - 1)).toStringAsFixed(1)} %";

        initialTotal = 0.0;
      }

      for (var i = 1; i < grandTotalData.length; i++) {
        for (var b = 1; b < vendorData.length + 1; b++) {
          // debugPrint("INI B : ${data[b]['data'][i]}");

          initialSLATotal +=
              double.tryParse(data[b]['data'][i].split(" ")[0]) ?? 0;

          grandTotalData[i] =
              "${(initialSLATotal / vendorData.length).toStringAsFixed(1)} %";
        }

        initialSLATotal = 0.0;
      }
    } catch (e) {
      debugPrint("EROR CUY $e");
    }

    return data;
  }

  double getSlaMonthly() {
    double sla = double.parse((grandTotalData[now - 1]).split(" ")[0]);

    return sla;
  }

  double getSlaQuarterly() {
    double slaQuarterly = 0.0;

    for (var i = 1; i < 7; i++) {
      slaQuarterly += double.parse(grandTotalData[i].split(" ")[0]);
    }

    var sla = (slaQuarterly / 6).toStringAsFixed(1);

    return double.parse(sla);
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
}
