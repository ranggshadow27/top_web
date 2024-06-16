import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teleglobal_operate/app/modules/home/views/home_view.dart';
import 'package:teleglobal_operate/app/modules/login/controllers/login_controller.dart';
import 'package:teleglobal_operate/app/modules/login/views/login_view.dart';
import 'package:teleglobal_operate/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        debugPrint("Berikut data user  ${snapshot.data?.email}");

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.interTextTheme(),
          ),
          title: "TOP App",
          initialRoute: snapshot.hasData ? Routes.HOME : Routes.LOGIN,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
