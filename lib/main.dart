import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'router/routes.dart';
import 'router/teacher_routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        buttonColor: Colors.black,
        primaryColor: Colors.black,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
          ),
          filled: true,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: Routes.LANDING,
      defaultTransition: Transition.fadeIn,
      getPages: [
        ...Routes.pages,
        ...TeacherRoutes.pages,
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
