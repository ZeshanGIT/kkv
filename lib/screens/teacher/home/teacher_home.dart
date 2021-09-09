import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../assets/MyAssets.dart';
import '../../../common/constants.dart';
import '../../../common/widgets/subject_card.dart';
import '../../../common/widgets/top_bar.dart';
import '../../../model/subject_card_theme.dart';
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
      body: LiquidPullToRefresh(
        onRefresh: controller.onRefresh,
        child: ListView(
          physics: BouncingScrollPhysics(),
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
            if (controller.classList.isEmpty)
              GestureDetector(
                onTap: controller.onCreateClass,
                child: Container(
                  height: Get.height - 160,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(MyAssets.NoDataPad),
                      SIZED_BOX_64,
                      Text("Tap anywhere to create a class"),
                      SIZED_BOX_128,
                    ],
                  ),
                ),
              ),
            if (controller.classList.isNotEmpty)
              ...controller.classList
                  .map(
                    (c) => SubjectCard(
                      classModel: c,
                      subjectCardTheme: SubjectCardTheme.fromSubject(c.subject),
                    ),
                  )
                  .toList(),

            // SubjectCard(
            //   title: "Social",
            //   darkColor: const Color(0xFFF48021),
            //   lightColor: const Color(0xFFFBDBA9),
            //   imgPath: MyAssets.Cat,
            //   onTap: () {},
            // ),
            // SubjectCard(
            //   title: "Mathematics",
            //   darkColor: const Color(0xFF4F2A74),
            //   lightColor: const Color(0xFFEDCFEA),
            //   imgPath: MyAssets.Cat,
            //   onTap: () {},
            // ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
