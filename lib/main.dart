import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkv/screens/get_started/get_started.dart';
import 'package:kkv/screens/teacher_or_student/teacher_or_student.bindings.dart';
import 'package:kkv/screens/teacher_or_student/teacher_or_student.dart';

import 'router/routes.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: Routes.GET_STARTED,
      getPages: [
        GetPage(
          name: Routes.GET_STARTED,
          page: () => GetStarted(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: Routes.TEACHER_OR_STUDENT,
          page: () => TeacherOrStudentPage(),
          transition: Transition.fadeIn,
          binding: TeacherOrStudentBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
