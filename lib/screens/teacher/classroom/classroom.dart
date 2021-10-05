import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/text_styles.dart';
import '../../../common/widgets/wrapper.dart';
import 'classroom_controller.dart';
import 'widgets/ClassroomTopBar.dart';
import 'widgets/assignments/assignments.dart';

class Classroom extends StatelessWidget {
  const Classroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassroomController>(
      builder: (controller) => Scaffold(
        floatingActionButton: controller.fabLabel != null
            ? FloatingActionButton.extended(
                onPressed: controller.createNew,
                backgroundColor: controller.subjectCardTheme.lightColor,
                icon: Icon(
                  Icons.add_rounded,
                  color: controller.subjectCardTheme.darkColor,
                ),
                label: Text(
                  controller.fabLabel!,
                  style:
                      TextStyle(color: controller.subjectCardTheme.darkColor),
                ),
              )
            : null,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ClassroomTopBar(),
            Wrapper(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Column(
                  children: [
                    TabBar(
                      controller: controller.tabController,
                      indicatorColor: Colors.black,
                      tabs: [
                        "Feed",
                        "Assignments",
                        "Students",
                      ]
                          .map(
                            (t) => Text(
                              t,
                              style: SMALL_SUB_HEADING,
                            ).paddingAll(16),
                          )
                          .toList(),
                    ),
                    Container(
                      height: Get.height - 128,
                      child: PageView(
                        controller: controller.pageController,
                        children: [
                          Text("Feed"),
                          Container(
                            // color: Colors.red,
                            // height: 256,
                            child: Assignment(),
                          ),
                          Text("Students"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
