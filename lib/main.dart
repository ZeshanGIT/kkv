import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkv/screens/home/home.dart';

import 'router/routes.dart';
import 'screens/get_started/get_started.dart';
import 'screens/teacher_or_student/teacher_or_student.bindings.dart';
import 'screens/teacher_or_student/teacher_or_student.dart';
import 'screens/teacher_signup/teacher_signup.dart';
import 'screens/teacher_signup/teacher_signup_binging.dart';

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
        GetPage(
          name: Routes.HOME,
          page: () => HomePage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
