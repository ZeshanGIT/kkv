import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkv/screens/landing/landing.dart';
import 'package:kkv/screens/landing/landing_binding.dart';
import 'package:kkv/screens/teacher/create_class/create_class.dart';

import 'router/routes.dart';
import 'router/teacher_routes.dart';
import 'screens/get_started/get_started.dart';
import 'screens/teacher/home/teacher_home.dart';
import 'screens/teacher/home/teacher_home_binding.dart';
import 'screens/teacher_or_student/teacher_or_student.bindings.dart';
import 'screens/teacher_or_student/teacher_or_student.dart';
import 'screens/teacher_signup/teacher_signup.dart';
import 'screens/teacher_signup/teacher_signup_binging.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
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
      initialRoute: Routes.LANDING,
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
          name: Routes.LANDING,
          page: () => LandingPage(),
          binding: LandingBinding(),
        ),
        GetPage(
          name: Routes.GET_STARTED,
          page: () => GetStartedPage(),
        ),
        GetPage(
          name: Routes.TEACHER_OR_STUDENT,
          page: () => TeacherOrStudentPage(),
          binding: TeacherOrStudentBinding(),
        ),
        GetPage(
          name: TeacherRoutes.SIGNUP,
          page: () => TeacherSignupPage(),
          binding: TeacherSignupBinding(),
        ),
        GetPage(
          name: TeacherRoutes.HOME,
          page: () => TeacherHomePage(),
          binding: TeacherHomeBinding(),
        ),
        GetPage(
          name: TeacherRoutes.CREATE_CLASS,
          page: () => CreateClass(),
          binding: TeacherHomeBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
