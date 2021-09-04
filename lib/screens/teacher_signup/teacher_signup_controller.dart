import 'package:get/get.dart';

import '../../model/user.model.dart';
import '../../services/teacher_user_service.dart';

class TeacherSigupController extends GetxController {
  String? empId;
  UserModel _userModel = Get.arguments;

  onEmpIdChange(String empId) {
    this.empId = empId;
    update();
  }

  onGetIn() async {
    TeacherUserService.addTeacher(_userModel, empId);
  }
}
