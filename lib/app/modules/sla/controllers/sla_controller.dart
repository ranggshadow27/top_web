import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SlaController extends GetxController {
  //TODO: Implement SlaController

  @override
  void onInit() async {
    super.onInit();

    data = await getSlaData();
    grandTotalData = await getTotalSlaData();

    if (data.length == 1) {
      debugPrint("Jalanin GetVendorData");

      await getVendorData();
    }

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
  final now = int.parse(DateFormat('M').format(DateTime.now())) + 1;

  double slaDaily = 0.0;
  double slaMonthly = 0.0;
  double slaQuarterly = 0.0;

  double initialTotal = 0.0;
  double initialSLATotal = 0.0;

  List<dynamic> data = [
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

  List<String> grandTotalData = [
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

  Future<List<dynamic>> getVendorData() async {
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

      await saveSlaData();
    } catch (e) {
      debugPrint("EROR CUY $e");
    }

    return data;
  }

  Future saveSlaData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString('slaMonthly', jsonEncode(data));
    debugPrint('Ini slaMonthly ${data.toString()}');

    await pref.setStringList('slaTotal', grandTotalData);
    debugPrint('Ini slaTotal ${grandTotalData.toString()}');
  }

  Future getSlaData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var prefData = pref.getString('slaMonthly');

    debugPrint("ini prefDatanya : $prefData");

    if (prefData != null) {
      List<dynamic> getData = jsonDecode(prefData);

      return getData;
    }

    return data;
  }

  Future getTotalSlaData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      var prefData = pref.getStringList('slaTotal');
      debugPrint("ini prefTotalDatanya : $prefData");

      if (prefData != null) {
        List<dynamic> getData = prefData;

        return getData;
      }
    } catch (e) {
      debugPrint("ini ERORNYA : $e");
    } finally {
      debugPrint("Selesai");
    }

    return grandTotalData;
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
