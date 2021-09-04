import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/model/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  String? role, id;
  UserModel? user;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    role = prefs.getString("role");
    print(prefs.getString("user"));
    user = UserModel.fromJson(prefs.getString("user") ?? "{}");
    id = prefs.getString("id");
    update();
  }
}
