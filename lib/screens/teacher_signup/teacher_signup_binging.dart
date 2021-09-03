import 'package:get/get.dart';
import 'package:kkv/screens/teacher_signup/teacher_signup_controller.dart';

class TeacherSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherSigupController());
  }
}
