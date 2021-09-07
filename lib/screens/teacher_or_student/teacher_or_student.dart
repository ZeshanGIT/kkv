import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/MyAssets.dart';
import '../../common/constants.dart';
import '../../common/widgets/bottom_width_button.dart';
import '../../common/widgets/top_bar.dart';
import '../../router/student_routes.dart';
import '../../router/teacher_routes.dart';
import 'teacher_or_student.controller.dart';
import 'teacher_student_card.dart';

class TeacherOrStudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherOrStudentController>(
        builder: (controller) => Stack(
              children: [
                IgnorePointer(
                  ignoring: controller.loading,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      controller.loading ? Colors.black12 : Colors.transparent,
                      BlendMode.darken,
                    ),
                    child: Scaffold(
                      body: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SIZED_BOX_MAX_WIDTH,
                          TopBar(),
                          SIZED_BOX_32,
                          TeacherStudentCard(
                            title: "Teacher",
                            desc:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet",
                            color: Color(0xFFD5395E),
                            img: MyAssets.TeacherDpPlaceholder,
                            goTo: TeacherRoutes.SIGNUP,
                            onSelectColor: Color(0xFFF5EBD2),
                            role: UserRole.TEACHER,
                          ),
                          TeacherStudentCard(
                            title: "Student",
                            desc:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet",
                            color: Color(0xFF66BFA3),
                            img: MyAssets.StudentDpPlaceholder,
                            goTo: StudentRoutes.SIGNUP,
                            onSelectColor: Color(0xFF38525F),
                            role: UserRole.STUDENT,
                          ),
                          Spacer(),
                          BottomWidthBlackButton(
                            text: "Continue in with Google",
                            onPressed: controller.onTapContinue,
                          ).paddingAll(8)
                        ],
                      ).paddingAll(16),
                    ),
                  ),
                ),
                if (controller.loading)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white60,
                              blurRadius: 16,
                              offset: Offset(0, 4),
                            )
                          ],
                          color: Colors.white,
                        ),
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
              ],
            ));
  }
}
