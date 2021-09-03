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

  // late Animation<TimelineValue<AnimProps>> teacherAnimation;
  // late Animation<TimelineValue<AnimProps>> studentAnimation;

  // late TOSCardAnim teacherTimelineValue;
  // late TOSCardAnim studentTimelineValue;

  // late AnimationController _teacherController;
  // late AnimationController _studentController;

  // late TimelineScene<AnimProps> timelineTween;

  // @override
  // void onInit() {
  //   super.onInit();

  //   _studentController =
  //       AnimationController(vsync: this, duration: 1.5.seconds);
  //   _teacherController =
  //       AnimationController(vsync: this, duration: 1.5.seconds);

  //   timelineTween = TimelineTween<AnimProps>()
  //       .addScene(begin: 0.milliseconds, duration: 1.5.seconds)
  //       .animate(
  //         AnimProps.liquidFill,
  //         tween: (-0.1).tweenTo(1.1),
  //       )
  //       .animate(
  //         AnimProps.textColor,
  //         tween: 0.0.tweenTo(1.0),
  //       );
  //   teacherAnimation = timelineTween.parent.animatedBy(_teacherController);
  //   studentAnimation = timelineTween.parent.animatedBy(_studentController);

  //   teacherAnimation.obs.listen((val) {
  //     print("Updating teacher val");
  //     teacherTimelineValue.liquidFill = val.value.get(AnimProps.liquidFill);
  //     teacherTimelineValue.color = val.value.get(AnimProps.textColor);
  //     update();
  //   });

  //   studentAnimation.value.obs.listen((val) {
  //     studentTimelineValue.liquidFill = val.get(AnimProps.liquidFill);
  //     studentTimelineValue.color = val.get(AnimProps.textColor);
  //     update();
  //   });
  // }

  setSelectedRole(String role) {
    selectedRole = role;
    update();
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
