import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/teacher_or_student.dart';
import '../../common/constants.dart';
import '../../common/text_styles.dart';
import '../../common/widgets/bottom_width_button.dart';
import '../../router/routes.dart';
import 'teacher_or_student.controller.dart';
import 'teacher_student_card.dart';

class TeacherOrStudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SIZED_BOX_MAX_WIDTH,
          buildTopBar(),
          SIZED_BOX_32,
          TeacherStudentCard(
            title: "Teacher",
            desc:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet",
            color: Color(0xFFD5395E),
            img: TeacherOrStudentAssets.teacher,
            goTo: Routes.TEACHER_SIGNUP,
            onSelectColor: Color(0xFFF5EBD2),
          ),
          TeacherStudentCard(
            title: "Student",
            desc:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet",
            color: Color(0xFF66BFA3),
            img: TeacherOrStudentAssets.student,
            goTo: Routes.STUDENT_SIGNUP,
            onSelectColor: Color(0xFF38525F),
          ),
          Spacer(),
          GetBuilder(builder:
              (TeacherOrStudentController _teacherOrStudentController) {
            return BottomWidthBlackButton(
              text: "Sign in with Google",
              onPressed: _teacherOrStudentController.selectedRole == null
                  ? null
                  : () {
                      print("Sign in with Google");
                    },
            ).paddingAll(8);
          }),
        ],
      ).paddingAll(16),
    );
  }

  Row buildTopBar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 32,
          ),
        ),
        Expanded(
          child: Center(
            child: Hero(
              tag: "student-management",
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  "Student Management",
                  style: STUDENT_MANAGEMENT_TEXT_STYLE,
                ),
              ),
            ),
          ),
        ),
        //Filler
        Opacity(
          opacity: 0,
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.chevron_left_rounded,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }
}
