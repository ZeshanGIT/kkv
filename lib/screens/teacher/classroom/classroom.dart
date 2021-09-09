import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/common/text_styles.dart';
import 'package:kkv/common/widgets/wrapper.dart';
import 'package:kkv/model/class_model.dart';
import 'package:kkv/model/subject_card_theme.dart';
import 'package:kkv/utilities/extensions/text_hero_transparent.dart';

class Classroom extends StatelessWidget {
  final ClassModel classModel;
  const Classroom(this.classModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubjectCardTheme subjectCardTheme =
        SubjectCardTheme.fromSubject(classModel.subject);
    return Scaffold(
      body: ListView(
        children: [
          buildTopBar(subjectCardTheme),
          Wrapper(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: TabBar(
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildTopBar(SubjectCardTheme subjectCardTheme) {
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
