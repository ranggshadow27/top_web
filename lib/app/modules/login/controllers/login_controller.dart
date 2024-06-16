import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    if (auth.currentUser != null) {
      debugPrint("Anda Sudah Login");

      Get.offAllNamed(Routes.HOME);
    }
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final count = 0.obs;

  TextEditingController emailTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  TextEditingController usernameTC = TextEditingController();
  TextEditingController passwordConfirmTC = TextEditingController();
  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> registerUser() async {
    try {
      if (emailTC.text.isNotEmpty && passwordTC.text.isNotEmpty && usernameTC.text.isNotEmpty) {
        if (passwordTC.text == passwordConfirmTC.text) {
          UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: emailTC.text,
            password: passwordTC.text,
          );

          User? user = userCredential.user;

          debugPrint("----------> Berikut data usernya \n$user");

          if (user != null) {
            await firestore.collection('users').doc(user.uid).set(
              {
                'username': usernameTC.text,
                'createdDate': DateTime.now().toIso8601String(),
                'email': user.email,
                'uid': user.uid,
              },
            );
          }

          debugPrint("Berhasil Mendaftarkan User Brow");
        }
      } else {
        debugPrint("Mohon isi Semua Field Terlebih dahulu!");
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("${e.code} Gagal Meregister Akun, Err : ${e.message}");
    } finally {
      emailTC.clear();
      passwordTC.clear();
      passwordConfirmTC.clear();
      usernameTC.clear();

      Get.back();
    }
  }

  Future<void> loginUser() async {
    try {
      if (emailTC.text.isNotEmpty && passwordTC.text.isNotEmpty) {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailTC.text,
          password: passwordTC.text,
        );

        User? user = userCredential.user;

        debugPrint("----------> Berikut data usernya \n$user");

        if (user != null) {
          Get.offAllNamed(Routes.HOME);
        }
      } else {
        debugPrint("Lengkapi Data login dahulu");
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("${e.code} Gagal Login, Err : ${e.message}");
    } finally {
      emailTC.clear();
      passwordTC.clear();

      // Get.back();
    }
  }

  void increment() => count.value++;
}
