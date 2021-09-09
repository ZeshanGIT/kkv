import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';

class TOSCardAnim {
  double liquidFill = -0.1;
  Color color = Colors.black;
}

class TeacherOrStudentController extends GetxController
    with SingleGetTickerProviderMixin {
  String? selectedRole;
  bool loading = false;

  setSelectedRole(String role) {
    selectedRole = role;
    update();
  }

  Function()? get onTapContinue {
    return selectedRole != null ? signInWithGoogle : null;
  }

  signInWithGoogle() async {
    loading = true;
    update();
    UserCredential? userCredential =
        await MyAuth.signInWithGoogle(selectedRole!);
    if (userCredential == null) {
      loading = false;
      update();
      Get.dialog(
        AlertDialog(
          title: Text("Try again"),
          content: Text("Sign in failed !"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Try again"),
            ),
          ],
        ),
      );
    }
  }
}
