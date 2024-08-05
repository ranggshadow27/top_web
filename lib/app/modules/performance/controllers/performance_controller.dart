import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PerformanceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List<dynamic> data = [
    {
      'data': [
        'Rank',
        'Vendor Name',
        'Nama Kriteria',
        'Kode',
        'Bobot',
        'Action'
      ],
      'isHeader': true,
    },
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
}
