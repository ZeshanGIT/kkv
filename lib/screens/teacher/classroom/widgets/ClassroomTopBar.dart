import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/constants.dart';
import '../../../../model/class_model.dart';
import '../../../../model/subject_card_theme.dart';
import '../../../../utilities/extensions/text_hero_transparent.dart';

class ClassroomTopBar extends StatelessWidget {
  final SubjectCardTheme subjectCardTheme;
  final ClassModel classModel;
  const ClassroomTopBar({
    Key? key,
    required this.subjectCardTheme,
    required this.classModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: subjectCardTheme.lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: Get.back,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: subjectCardTheme.darkColor,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classModel.subject,
                    style: SUBJECT_TITLE_STYLE.copyWith(
                      color: subjectCardTheme.darkColor,
                    ),
                  ).hero(classModel.classId + '-title'),
                  Text(
                    classModel.grade + " - " + classModel.section,
                    style: SUBJECT_SUB_HEADING_STYLE.copyWith(
                      color: subjectCardTheme.darkColor.withOpacity(0.7),
                    ),
                  ).hero(classModel.classId + "-grade-sec"),
                  SIZED_BOX_8,
                  SizedBox(
                    width: Get.width * 0.5,
                    child: Text(
                      "Elit sint sint id mollit esse ad pariatur aute.",
                      style: SUBJECT_DESC_STYLE.copyWith(
                        color: subjectCardTheme.darkColor,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Hero(
                tag: classModel.classId + '-img',
                child: SvgPicture.asset(
                  subjectCardTheme.img,
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
