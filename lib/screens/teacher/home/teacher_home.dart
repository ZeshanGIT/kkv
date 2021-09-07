import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/MyAssets.dart';
import '../../../common/constants.dart';
import '../../../common/widgets/subject_card.dart';
import '../../../common/widgets/top_bar.dart';
import '../widgets/teacher_floating_drawer.dart';
import 'teacher_home_controller.dart';

class TeacherHomePage extends GetView<TeacherHomeController> {
  const TeacherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black12,
      key: controller.scaffoldKey,
      drawer: TeacherFloatingDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              leadingIcon: Icons.graphic_eq_rounded,
              leadingAction: controller.openDrawer,
              trailingIcon: Icons.notifications_none_rounded,
            ),
            SIZED_BOX_24,
            Text(
              "Hi, ${controller.user?.name ?? ''}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ).paddingAll(16),
            SubjectCard(
              title: "Mathematics",
              darkColor: const Color(0xFF4F2A74),
              lightColor: const Color(0xFFEDCFEA),
              imgPath: MyAssets.Cat,
              onTap: () {},
            ),
            SubjectCard(
              title: "Social",
              darkColor: const Color(0xFFF48021),
              lightColor: const Color(0xFFFBDBA9),
              imgPath: MyAssets.Cat,
              onTap: () {},
            ),
            SubjectCard(
              title: "Mathematics",
              darkColor: const Color(0xFF4F2A74),
              lightColor: const Color(0xFFEDCFEA),
              imgPath: MyAssets.Cat,
              onTap: () {},
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
