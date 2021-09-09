import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../assets/MyAssets.dart';
import '../../model/class_model.dart';
import '../../model/subject_card_theme.dart';
import '../../screens/teacher/home/teacher_home_controller.dart';
import '../../utilities/extensions/text_hero_transparent.dart';
import '../constants.dart';

class SubjectCard extends GetView<TeacherHomeController> {
  final SubjectCardTheme subjectCardTheme;
  final ClassModel classModel;

  SubjectCard({
    Key? key,
    required this.classModel,
    required this.subjectCardTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.onOpenSubject(classModel),
      child: Stack(
        children: [
          Container(
            height: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: subjectCardTheme.shadowColor,
                  blurRadius: 20,
                  offset: Offset(0, 8),
                )
              ],
              borderRadius: BORDER_RADIUS_MEDIUM,
              color: subjectCardTheme.lightColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: classModel.classId + '-img',
                  child: SvgPicture.asset(
                    subjectCardTheme.img,
                    height: Get.width * 0.2,
                  ),
                ),
                SIZED_BOX_16,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    ).hero(classModel.classId + '-grade-sec'),
                  ],
                ),
              ],
            ).paddingAll(24),
          ).paddingAll(16),
          Positioned(
            bottom: 16,
            right: 16,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                subjectCardTheme.darkColor,
                BlendMode.srcATop,
              ),
              child: SvgPicture.asset(MyAssets.SubjectCardCircle),
            ),
          ),
        ],
      ),
    );
  }
}
