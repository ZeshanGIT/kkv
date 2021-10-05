import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kkv/screens/teacher/classroom/classroom_controller.dart';

import '../../../../common/constants.dart';
import '../../../../utilities/extensions/text_hero_transparent.dart';

class ClassroomTopBar extends GetView<ClassroomController> {
  const ClassroomTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: controller.subjectCardTheme.lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: controller.subjectCardTheme.darkColor,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.classModel.subject,
                    style: SUBJECT_TITLE_STYLE.copyWith(
                      color: controller.subjectCardTheme.darkColor,
                    ),
                  ).hero(controller.classModel.classId + '-title'),
                  Text(
                    controller.classModel.grade +
                        " - " +
                        controller.classModel.section,
                    style: SUBJECT_SUB_HEADING_STYLE.copyWith(
                      color: controller.subjectCardTheme.darkColor
                          .withOpacity(0.7),
                    ),
                  ).hero(controller.classModel.classId + "-grade-sec"),
                  SIZED_BOX_8,
                  SizedBox(
                    width: Get.width * 0.5,
                    child: Text(
                      "Elit sint sint id mollit esse ad pariatur aute.",
                      style: SUBJECT_DESC_STYLE.copyWith(
                        color: controller.subjectCardTheme.darkColor,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Hero(
                tag: controller.classModel.classId + '-img',
                child: SvgPicture.asset(
                  controller.subjectCardTheme.img,
                  height: Get.width * 0.2,
                ),
              )
            ],
          ).paddingAll(16)
        ],
      ).paddingAll(16),
    );
  }
}
