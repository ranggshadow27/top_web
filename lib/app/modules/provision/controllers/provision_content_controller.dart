import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProvisionContentController extends GetxController {
  //TODO: Implement ProvisionContentController

  @override
  void onInit() {
    super.onInit();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxInt indexActive = 0.obs;

  TextEditingController gsTC = TextEditingController();

  switchToGSData() {
    indexActive.value = 1;
  }

  switchToRemoteData() {
    indexActive.value = 0;
  }

  addGSVendor() async {
    try {
      if (gsTC.text.isNotEmpty) {
        String gsName = "";
        String gsAlias = "";

        List<String> gsSplit = gsTC.text.capitalize!.split(" ");

        for (var i = 0; i < gsSplit.length; i++) {
          gsAlias += gsSplit[i][0];
          gsName += "${gsSplit[i].capitalizeFirst} ";
        }

        debugPrint("$gsAlias \n $gsName");

        await firestore.collection('gs_data').doc(gsName).set({
          'gsName': gsName,
          'alias': gsAlias,
          'createdAt': DateTime.now().toIso8601String(),
          'status': 'Active',
          'totalRemote': 0,
        });
      } else {
        debugPrint("Mohon isi Semua Field Terlebih dahulu!");
      }
    } on FirebaseException catch (e) {
      debugPrint("${e.code} Gagal Menambahkan GS, Err : ${e.message}");
    } finally {
      gsTC.clear();

      Get.back();
    }
  }
}
