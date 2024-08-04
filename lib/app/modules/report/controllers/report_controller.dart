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
      'data': ['Penilaian', 'No', 'Nama Kriteria', 'Kode', 'Bobot', ''],
      'isHeader': true,
    },
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController criteriaTC = TextEditingController();
  TextEditingController valueTC = TextEditingController();

  RxString criteriaType = "".obs;

  addReportCriteria() async {
    try {
      if (criteriaTC.text.isNotEmpty &&
          valueTC.text.isNotEmpty &&
          criteriaType.isNotEmpty) {
        await firestore.collection('report_criteria').doc().set({
          'name': criteriaTC.text,
          'value': double.tryParse(valueTC.text),
          'type': criteriaType.value,
        });

        Get.back();

        valueTC.clear();
        criteriaTC.clear();

        update();
      } else {
        debugPrint("Mohon isi Semua Field Terlebih dahulu!");
      }
    } on FirebaseException catch (e) {
      debugPrint("${e.code} Gagal Menambahkan Criteria, Err : ${e.message}");
    } finally {
      debugPrint("Data Update");
    }
  }

  getReportCriteria() async {
    var querySnap =
        await firestore.collection('report_criteria').orderBy('type').get();

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
        'isHeader': false
      });
    }

    update();
  }
}
