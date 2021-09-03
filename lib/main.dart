import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkv/screens/get_started/get_started.dart';
import 'package:kkv/screens/teacher_or_student/teacher_or_student.bindings.dart';
import 'package:kkv/screens/teacher_or_student/teacher_or_student.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kkv/screens/teacher_signup/teacher_signup.dart';
import 'package:kkv/screens/teacher_signup/teacher_signup_binging.dart';

import 'router/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GetMaterialApp(
      theme: ThemeData(
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
      initialRoute: Routes.GET_STARTED,
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
          name: Routes.GET_STARTED,
          page: () => GetStarted(),
        ),
        GetPage(
          name: Routes.TEACHER_OR_STUDENT,
          page: () => TeacherOrStudentPage(),
          binding: TeacherOrStudentBinding(),
        ),
        GetPage(
          name: Routes.TEACHER_SIGNUP,
          page: () => TeacherSignup(),
          binding: TeacherSignupBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
