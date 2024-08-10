import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformanceController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await getCriteriaData();

    await getVendorData();

    await ();
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
    QuerySnapshot query =
        await firestore.collection('report_criteria').orderBy('id').get();

    List<String> criteriaIdList =
        query.docs.map((e) => e['id'] as String).toList();
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
    QuerySnapshot query = await firestore
        .collection('gs_data')
        .orderBy('performance', descending: true)
        .get();

    List<String> vendorData =
        query.docs.map((e) => e['gsName'] as String).toList();

    List<String> vendorPerformance =
        query.docs.map((e) => e['performance'].toString()).toList();

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
      }

      int headerLength = data[0]['data'].length - 1;

      for (var i = 0; i < vendorPerformance.length; i++) {
        data[i + 1]['data'][headerLength] =
            '${double.tryParse(vendorPerformance[i])!.toStringAsFixed(1)} %';
      }
    } catch (e) {
      debugPrint("INI ERORNYA:\n$e");
    }

    debugPrint("INI DATANYA:\n$data");

    update();

    return vendorData;
  }

  updatePage() {
    update();
  }

  Future<List<Map<String, dynamic>>> getPerformanceData() async {
    QuerySnapshot query = await firestore
        .collection('vendor_performance')
        .orderBy('performance', descending: true)
        .get();

    List<Map<String, dynamic>> vendorPerf =
        query.docs.map((e) => e.data() as Map<String, dynamic>).toList();

    try {
      for (var i = 1; i < data.length + 1; i++) {
        debugPrint("COBA COBA $i/${data.length + 1}");
        for (var b = 2; b < data[0]['data'].length - 1; b++) {
          debugPrint("COBA $b/${data[0]['data'].length - 1}");

          if (vendorPerf[i - 1].isNotEmpty) {
            if (vendorPerf[i - 1]['K${b - 1}'] != null) {
              data[i]['data'][b] = vendorPerf[i - 1]['K${b - 1}'].toString();
            } else {
              data[i]['data'][b] = "-";
            }
          }
        }
      }
    } catch (e) {
      debugPrint("INI ERORNYA:\n$e");
    }

    debugPrint("INI vendorPerf :\n$vendorPerf");
    debugPrint("INI Data Lengkapnya :\n$data");

    update();

    return vendorPerf;
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

    vpData['performance'] = double.tryParse(
      (performanceTotal * 100).toStringAsFixed(1),
    );

    await firestore
        .collection('vendor_performance')
        .doc(selectedGS.value)
        .set(vpData);

    await firestore.collection('gs_data').doc(selectedGS.value).update({
      'performance': double.tryParse(
        (performanceTotal * 100).toStringAsFixed(1),
      )
    });

    debugPrint("Berhasil");

    data.removeRange(1, data.length);

    await getVendorData();

    await getPerformanceData();

    Get.back();

    for (var i = 0; i < dynamicTC.length; i++) {
      dynamicTC[i].clear();
    }
  }
}
