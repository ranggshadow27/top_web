import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformanceController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await getCriteriaData();

    await getVendorData();
  }

  List<dynamic> data = [
    {
      'data': ['Rank', 'Vendor'],
      'isHeader': true,
    },
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<TextEditingController> dynamicTC = [];
  RxString selectedGS = "".obs;

  Future<List<String>> getCriteriaData() async {
    QuerySnapshot query = await firestore.collection('report_criteria').orderBy('id').get();

    List<String> criteriaIdList = query.docs.map((e) => e['id'] as String).toList();
    dynamicTC.clear();

    for (var _ in criteriaIdList) {
      dynamicTC.add(TextEditingController());
    }

    criteriaIdList.add('Total');

    data[0]['data'].addAll(criteriaIdList);

    debugPrint("INI DATA KRITERIANYA:\n$data");

    update();

    return criteriaIdList;
  }

  Future<List<String>> getVendorData() async {
    QuerySnapshot query = await firestore.collection('gs_data').orderBy('createdAt').get();

    List<String> vendorData = query.docs.map((e) => e['gsName'] as String).toList();

    try {
      for (var i = data.length - 1; i < vendorData.length; i++) {
        data.add({
          'data': [
            '${i + 1}',
            vendorData[i],
          ],
          'isHeader': false,
        });

        for (var b = 2; b < data[0]['data'].length; b++) {
          data[i + 1]['data'].add('-');
        }

        debugPrint("NIH DATA : ${data[i]['data']}");
      }
    } catch (e) {
      debugPrint("INI ERORNYA:\n$e");
    }

    debugPrint("INI DATANYA:\n$data");

    update();

    return vendorData;
  }

  addVendorPeformance() async {
    Map<String, dynamic> vpData = {};

    double performanceTotal = 0.0;

    debugPrint("TEst");

    for (var i = 0; i < dynamicTC.length; i++) {
      vpData['K${i + 1}'] = double.tryParse(dynamicTC[i].text);

      performanceTotal += double.tryParse(dynamicTC[i].text) ?? 0.0;
    }

    performanceTotal /= dynamicTC.length;

    await firestore.collection('vendor_performance').doc(selectedGS.value).set(vpData);

    await firestore.collection('gs_data').doc(selectedGS.value).update({
      'performance': double.tryParse(
        (performanceTotal * 100).toStringAsFixed(1),
      )
    });

    debugPrint("Berhasil");

    Get.back();

    for (var i = 0; i < dynamicTC.length; i++) {
      dynamicTC[i].clear();
    }
  }
}
