import 'package:get/get.dart';

import 'teacher_signup_controller.dart';

class TeacherSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherSigupController());
  }
}
