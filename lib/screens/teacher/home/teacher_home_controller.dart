import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kkv/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/teacher.model.dart';
import '../../../router/teacher_routes.dart';
import '../../../utilities/extensions/get_box/basic_extension.dart';
import '../../../utilities/extensions/get_box/teacher_box_extension.dart';

class TeacherHomeController extends GetxController {
  String? role, id;
  TeacherModel? user;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GetStorage _box = GetStorage();

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  onCreateClass() {
    Get.toNamed(TeacherRoutes.CREATE_CLASS);
  }

  @override
  void onInit() {
    user = _box.getTeacher();
    print(user);
    id = _box.getUid();
    super.onInit();
  }

  Future<void> logout() async {
    Get.back();
    Get.dialog(
      AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure ?"),
        actions: [
          ElevatedButton(
            onPressed: MyAuth.logout,
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: Get.back,
            child: Text("No"),
          ),
        ],
      ),
    );
  }
}
