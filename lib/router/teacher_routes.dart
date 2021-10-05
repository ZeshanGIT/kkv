import 'package:get/get.dart';

import '../screens/teacher/add_timetable/add_timetable.dart';
import '../screens/teacher/add_timetable/add_timetable_binding.dart';
import '../screens/teacher/class_preview/class_preview.dart';
import '../screens/teacher/class_preview/class_preview_binding.dart';
import '../screens/teacher/classroom/classroom.dart';
import '../screens/teacher/classroom/classroom_binding.dart';
import '../screens/teacher/classroom/widgets/assignments/add_assignment/add_assignment.dart';
import '../screens/teacher/classroom/widgets/assignments/add_assignment/add_assignment_binding.dart';
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
  static const String CLASS_PREVIEW = "/class-preview";
  static const String CLASS_ROOM = "/teacher/class-room";
  static const String ADD_ASSIGNMENT = "/teacher/add-assignment";

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
    ),
    GetPage(
      name: ADD_TIMETABLE,
      page: () => AddTimetable(),
      binding: AddTimetableBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: CLASS_PREVIEW,
      page: () => ClassPreview(),
      binding: ClassPreviewBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: CLASS_ROOM,
      page: () => Classroom(),
      binding: ClassroomBinding(),
    ),
    GetPage(
      name: ADD_ASSIGNMENT,
      page: () => AddAssignment(),
      binding: AddAssignmentBinding(),
      fullscreenDialog: true,
    ),
  ];
}
