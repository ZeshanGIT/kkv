import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kkv/assets/common_asset.dart';
import 'package:kkv/assets/home.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/screens/teacher/widgets/teacher_floating_drawer.dart';
import 'package:kkv/common/widgets/subject_card.dart';
import 'package:kkv/common/widgets/top_bar.dart';
import 'package:kkv/screens/teacher/home/teacher_home_controller.dart';
import 'package:simple_animations/simple_animations.dart';

class TeacherHomePage extends StatefulWidget {
  TeacherHomePage({Key? key}) : super(key: key);

  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> with AnimationMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherHomeController>(
      builder: (homeController) => Scaffold(
        drawerScrimColor: Colors.black12,
        key: homeController.scaffoldKey,
        drawer: TeacherFloatingDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                leftIconButton: IconButton(
                  onPressed: () => homeController.openDrawer(),
                  icon: Icon(Icons.graphic_eq),
                ),
                rightIconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_rounded),
                ),
              ),
              SIZED_BOX_24,
              Text(
                "Hi, ${homeController.user?.name}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingAll(16),
              SubjectCard(
                title: "Mathematics",
                darkColor: Color(0xFF4F2A74),
                lightColor: Color(0xFFEDCFEA),
                imgPath: HomeAssets.Cat,
                onTap: () {},
              ),
              SubjectCard(
                title: "Social",
                darkColor: Color(0xFFF48021),
                lightColor: Color(0xFFFBDBA9),
                imgPath: HomeAssets.Cat,
                onTap: () {},
              ),
              SubjectCard(
                title: "Mathematics",
                darkColor: Color(0xFF4F2A74),
                lightColor: Color(0xFFEDCFEA),
                imgPath: HomeAssets.Cat,
                onTap: () {},
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
