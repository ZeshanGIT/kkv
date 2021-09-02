import 'package:get/get.dart';

import 'teacher_or_student.controller.dart';

class TeacherOrStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherOrStudentController());
  }
}
