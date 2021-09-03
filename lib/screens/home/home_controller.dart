import 'dart:convert';

import 'package:get/get.dart';
import 'package:kkv/model/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String? role, id;
  UserModel? user;

  @override
  Future<void> onReady() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    role = prefs.getString("role");
    print(prefs.getString("user"));
    user = UserModel.fromJson(prefs.getString("user") ?? "{}");
    id = prefs.getString("id");
    update();
    super.onReady();
  }
}
