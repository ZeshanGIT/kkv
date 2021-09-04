import 'package:get/get.dart';

import 'teacher_home_controller.dart';

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherHomeController());
  }
}
