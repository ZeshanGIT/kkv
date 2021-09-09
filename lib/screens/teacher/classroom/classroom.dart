import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/text_styles.dart';
import '../../../common/widgets/wrapper.dart';
import '../../../model/class_model.dart';
import '../../../model/subject_card_theme.dart';
import 'classroom_controller.dart';
import 'widgets/ClassroomTopBar.dart';
import 'widgets/assignments/assignments.dart';

class Classroom extends StatelessWidget {
  final ClassModel classModel;
  const Classroom(this.classModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubjectCardTheme subjectCardTheme =
        SubjectCardTheme.fromSubject(classModel.subject);
    return GetBuilder<ClassroomController>(
      builder: (controller) => Scaffold(
        floatingActionButton: controller.fabLabel != null
            ? FloatingActionButton.extended(
                onPressed: controller.createNew,
                backgroundColor: subjectCardTheme.lightColor,
                icon: Icon(
                  Icons.add_rounded,
                  color: subjectCardTheme.darkColor,
                ),
                label: Text(
                  controller.fabLabel!,
                  style: TextStyle(color: subjectCardTheme.darkColor),
                ),
              )
            : null,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ClassroomTopBar(
              subjectCardTheme: subjectCardTheme,
              classModel: classModel,
            ),
            Wrapper(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: TabBar(
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
                    body: TabBarView(
                      controller: controller.tabController,
                      children: [
                        Text("Feed"),
                        Assignment(),
                        Text("Students"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
