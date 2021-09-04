import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';
import '../../router/routes.dart';
import '../../router/student_routes.dart';
import '../../router/teacher_routes.dart';

class LandingController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String? role = sharedPreferences.getString(StoredDetails.ROLE);

        if (role == UserRole.STUDENT)
          Get.offNamed(StudentRoutes.HOME);
        else
          Get.offNamed(TeacherRoutes.HOME);
      }
    } else
      Get.offNamed(Routes.GET_STARTED);
  }
}
