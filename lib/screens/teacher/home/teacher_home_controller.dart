import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/model/teacher.model.dart';
import 'package:kkv/model/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherHomeController extends GetxController
    with SingleGetTickerProviderMixin {
  String? role, id;
  TeacherModel? user;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  onCreateClass() {}

  @override
  Future<void> onReady() async {
    super.onReady();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    role = prefs.getString(StoredDetails.ROLE);
    user = TeacherModel.fromJson(prefs.getString(StoredDetails.USER) ?? "{}");
    id = prefs.getString(StoredDetails.USER_ID);
    update();
  }

  void logout() {}
}
