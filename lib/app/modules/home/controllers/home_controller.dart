import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    if (auth.currentUser == null) {
      debugPrint("Please Login Dahulu");

      Get.offAllNamed(Routes.LOGIN);

      Get.snackbar("Login Required", "Please Login to your Account first");
    }

    debugPrint("Please Login ${auth.currentUser}");
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final int pageIndex = 1;

  Future<DocumentSnapshot> getUserCredential() {
    return firestore.collection('users').doc(auth.currentUser!.uid).get();
  }

  Future<void> logout() async {
    await auth.signOut();

    if (auth.currentUser == null) {
      Get.offAndToNamed(Routes.LOGIN);
      debugPrint("Berhasil Logout");
    }
  }

  RxList locations = [
    // {'lat': -6.411330, 'long': 107.149315}, // Cibarusah
    // {'lat': 0.484928, 'long': 115.102660}, // Long Bagun
    // {'lat': 0.113631, 'long': 115.830833}, // Long Pahangai
    // {'lat': -4.083333, 'long': 137.183334}, // Puncak Jaya
    // {'lat': -4.544537, 'long': 136.887018}, // Timika
    // {'lat': 4.155055, 'long': 117.112526}, // Mansalong
    // {'lat': 3.313204, 'long': 117.591316}, // Tarakan
    // {'lat': -8.670458, 'long': 115.212629}, // Denpasar
    // {'lat': -1.237930, 'long': 116.852852}, // Balikpapan
    // {'lat': -0.876163, 'long': 131.255828}, // Sorong
    // {'lat': -9.336666666666666, 'long': 124.86049999999997}, // Sorong
    // {'lat': -1.4032333333333336, 'long': 115.15176666666666}, // Sorong
    // {'lat': -3.3000000000000003, 'long': 114.68333333333332}, // Sorong
  ].obs;

  Future<List> getRemoteData() async {
    var query = await firestore.collection('remote_data').orderBy('createdAt').get();

    return query.docs
        .map(
          (doc) => {
            'lat': double.parse(doc['lat']),
            'long': double.parse(doc['long']),
            'name': doc['remoteName']
          },
        )
        .toList();
  }

  @override
  void onInit() async {
    super.onInit();

    locations.value = await getRemoteData();

    debugPrint("Please Login $locations");
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
