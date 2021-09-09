import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';
import '../../model/student.model.dart';
import '../../model/teacher.model.dart';
import '../../router/routes.dart';
import '../../router/student_routes.dart';
import '../../router/teacher_routes.dart';
import '../../utilities/extensions/get_box/basic_extension.dart';
import '../../utilities/extensions/get_box/student_box_extension.dart';
import '../../utilities/extensions/get_box/teacher_box_extension.dart';
import '../../utilities/extensions/shared_preferences/basic_extension.dart';
import '../../utilities/extensions/shared_preferences/student_sp_extension.dart';
import '../../utilities/extensions/shared_preferences/teacher_sp_extension.dart';

class LandingController extends GetxController {
  final _box = GetStorage();

  @override
  Future<void> onReady() async {
    super.onReady();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? role = sharedPreferences.getRole();
      String? uid = sharedPreferences.getUid();
      if (role == null || uid == null) {
        Get.offNamed(Routes.GET_STARTED);
        return;
      }
      _box.setRole(role);
      _box.setUid(uid);
      if (role == UserRole.STUDENT) {
        StudentModel? _tempStudent = sharedPreferences.getStudent();
        if (_tempStudent == null) {
          Get.offNamed(Routes.GET_STARTED);
          return;
        }
        _box.setStudent(_tempStudent);
        _box.setClassList(sharedPreferences.getClassList());
        Get.offNamed(StudentRoutes.HOME);
      } else {
        TeacherModel? _tempTeacher = sharedPreferences.getTeacher();
        if (_tempTeacher == null) {
          Get.offNamed(Routes.GET_STARTED);
          return;
        }
        _box.setTeacher(_tempTeacher);
        _box.setClassList(sharedPreferences.getClassList());
        Get.offNamed(TeacherRoutes.HOME);
      }
    } else
      Get.offNamed(Routes.GET_STARTED);
  }
}
