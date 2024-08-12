import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await getReportCriteria();
  }

  void onReady() async {
    super.onReady();

    // await getReportCriteria();
  }

  List<dynamic> data = [
    {
      'data': ['Penilaian', 'No', 'Nama Kriteria', 'Kode', 'Bobot', 'Action'],
      'isHeader': true,
    },
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController criteriaTC = TextEditingController();
  TextEditingController valueTC = TextEditingController();

  RxString criteriaType = "".obs;

  addReportCriteria() async {
    try {
      if (criteriaTC.text.isNotEmpty && valueTC.text.isNotEmpty && criteriaType.isNotEmpty) {
        String criteriaId = "K${data.length}";

        debugPrint("criteriaId nya adalah : $criteriaId");

        await firestore.collection('report_criteria').doc(criteriaId).set({
          'name': criteriaTC.text,
          'value': double.tryParse(valueTC.text),
          'type': criteriaType.value,
          'id': data.length,
          'criteriaId': criteriaId
        });

        if (data.length > 1 && data[0]['isHeader'] == true) {
          data.removeRange(1, data.length);
        }

        await getReportCriteria();
      } else {
        debugPrint("Mohon isi Semua Field Terlebih dahulu!");
      }
    } on FirebaseException catch (e) {
      debugPrint("${e.code} Gagal Menambahkan Criteria, Err : ${e.message}");
    } finally {
      valueTC.clear();
      criteriaTC.clear();

      Get.back();

      debugPrint("Data Update");
    }
  }

  getReportCriteria() async {
    var querySnap = await firestore.collection('report_criteria').orderBy('id').get();

    var snapData = querySnap.docs;

    for (var i = 0; i < snapData.length; i++) {
      data.add({
        'data': [
          snapData[i]['type'],
          '${data.length}',
          snapData[i]['name'],
          'K${data.length}',
          '${snapData[i]['value']}',
          ''
        ],
        'id': snapData[i]['id'] ?? 'null',
        'isHeader': false
      });
    }

    update();
  }

  updateReportCriteria(String id) async {
    try {
      await firestore.collection('report_criteria').doc(id).update({
        'name': criteriaTC.text,
        'value': double.tryParse(valueTC.text) ?? 0.0,
        'type': criteriaType.value,
      });

      if (data.length > 1 && data[0]['isHeader'] == true) {
        data.removeRange(1, data.length);
      }

      await getReportCriteria();
    } on FirebaseException catch (e) {
      debugPrint("${e.code} Gagal Menambahkan Criteria, Err : ${e.message}");
    } finally {
      valueTC.clear();
      criteriaTC.clear();

      Get.back();

      debugPrint("Data Update");
    }
  }
}
