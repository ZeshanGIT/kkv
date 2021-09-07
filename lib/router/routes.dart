import 'package:get/get.dart';

import '../screens/get_started/get_started.dart';
import '../screens/landing/landing.dart';
import '../screens/landing/landing_binding.dart';
import '../screens/teacher_or_student/teacher_or_student.bindings.dart';
import '../screens/teacher_or_student/teacher_or_student.dart';

abstract class Routes {
  static const String LANDING = "/landing";
  static const String GET_STARTED = "/get-started";
  static const String TEACHER_OR_STUDENT = "/teacher-or-student";

  static final pages = [
    GetPage(
      name: LANDING,
      page: () => LandingPage(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: GET_STARTED,
      page: () => GetStartedPage(),
    ),
    GetPage(
      name: TEACHER_OR_STUDENT,
      page: () => TeacherOrStudentPage(),
      binding: TeacherOrStudentBinding(),
    )
  ];
}
