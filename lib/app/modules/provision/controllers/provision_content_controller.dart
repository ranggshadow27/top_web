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
  RxString selectedGS = "".obs;

  TextEditingController gsTC = TextEditingController();
  TextEditingController newRemoteTC = TextEditingController();
  TextEditingController latTC = TextEditingController();
  TextEditingController longTC = TextEditingController();

  switchToGSData() {
    indexActive.value = 1;
  }

  switchToRemoteData() {
    indexActive.value = 0;
  }

  Future<List<String>> getGSData() async {
    QuerySnapshot data =
        await firestore.collection('gs_data').orderBy('createdAt').get();

    return data.docs.map((doc) => doc['gsName'] as String).toList();
  }

  Future<QuerySnapshot> getQueryGSData() async {
    return await firestore.collection('gs_data').orderBy('createdAt').get();
  }

  Future<QuerySnapshot> getQueryRemoteData() async {
    return await firestore.collection('remote_data').orderBy('createdAt').get();
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

      update();

      Get.back();
    }
  }

  addRemote() async {
    try {
      if (latTC.text.isNotEmpty &&
          newRemoteTC.text.isNotEmpty &&
          longTC.text.isNotEmpty) {
        String gsAlias = "";
        debugPrint("INI DATA $gsAlias");
        debugPrint("INI DATA ${selectedGS.value}");
        debugPrint("INI DATA ${selectedGS.value.split(" ")}");

        List<String> gsSplit = selectedGS.value.split(" ");

        for (var i = 0; i < 3; i++) {
          gsAlias += gsSplit[i][0];
        }

        debugPrint("INI DATA $gsAlias");

        var getTotalRemote =
            await firestore.collection('gs_data').doc(selectedGS.value).get();
        int totalRemote = getTotalRemote.data()!['totalRemote'];

        await firestore.collection('gs_data').doc(selectedGS.value).update({
          'totalRemote': totalRemote += 1,
        });

        String formatedRemoteName = newRemoteTC.text.toUpperCase();

        await firestore.collection('remote_data').doc(newRemoteTC.text).set({
          'remoteName': formatedRemoteName,
          'gsVendor': gsAlias,
          'lat': latTC.text,
          'long': longTC.text,
          'createdAt': DateTime.now().toIso8601String(),
          'status': 'Active',
        });
      } else {
        debugPrint("Mohon isi Semua Field Terlebih dahulu!");
      }
    } on FirebaseException catch (e) {
      debugPrint("${e.code} Gagal Menambahkan GS, Err : ${e.message}");
    } finally {
      latTC.clear();
      longTC.clear();
      newRemoteTC.clear();

      update();

      Get.back();
    }
  }
}
