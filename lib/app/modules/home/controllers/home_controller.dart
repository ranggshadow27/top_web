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

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
