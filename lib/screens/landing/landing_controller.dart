import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:kkv/model/teacher.model.dart';
import 'package:kkv/router/routes.dart';
import 'package:kkv/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null)
      Get.offNamed(Routes.HOME);
    else
      Get.offNamed(Routes.GET_STARTED);
  }
}
