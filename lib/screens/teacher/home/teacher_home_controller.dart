import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kkv/router/teacher_routes.dart';

import '../../../model/teacher.model.dart';
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
  void onReady() {
    user = _box.getTeacher();
    id = _box.getUid();
    super.onReady();
  }

  void logout() {}
}
