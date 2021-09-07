import 'package:get/get.dart';

import '../screens/add_timetable/add_timetable.dart';
import '../screens/add_timetable/add_timetable_binding.dart';
import '../screens/teacher/create_class/create_class.dart';
import '../screens/teacher/create_class/create_class_binding.dart';
import '../screens/teacher/home/teacher_home.dart';
import '../screens/teacher/home/teacher_home_binding.dart';
import '../screens/teacher_signup/teacher_signup.dart';
import '../screens/teacher_signup/teacher_signup_binging.dart';

class TeacherRoutes {
  static const String SIGNUP = "/teacher-signup";
  static const String HOME = "/teacher-home";
  static const String CREATE_CLASS = "/create-class";
  static const String ADD_TIMETABLE = "/add-timetable";

  static final pages = [
    GetPage(
      name: SIGNUP,
      page: () => TeacherSignupPage(),
      binding: TeacherSignupBinding(),
    ),
    GetPage(
      name: HOME,
      page: () => TeacherHomePage(),
      binding: TeacherHomeBinding(),
    ),
    GetPage(
        name: CREATE_CLASS,
        page: () => CreateClass(),
        binding: CreateClassBinding(),
        children: [
          GetPage(
            name: ADD_TIMETABLE,
            page: () => AddTimetable(),
            binding: AddTimetableBinding(),
            fullscreenDialog: true,
          ),
        ]),
  ];
}
