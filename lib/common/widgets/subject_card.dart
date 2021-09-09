import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kkv/model/class_model.dart';
import 'package:kkv/model/subject_card_theme.dart';

import '../../assets/MyAssets.dart';
import '../constants.dart';

class SubjectCard extends StatelessWidget {
  // const SubjectCard({
  //   Key? key,
  //   required this.imgPath,
  //   required this.title,
  //   required this.darkColor,
  //   required this.lightColor,
  //   required this.onTap,
  // }) : super(key: key);

  // final String imgPath;
  // final String title;
  // final Color darkColor;
  // final Color lightColor;
  // final Function()? onTap;

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
      onTap: () {},
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
                SvgPicture.asset(
                  subjectCardTheme.img,
                  height: Get.width * 0.2,
                ),
                SIZED_BOX_16,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classModel.subject,
                      style: TextStyle(
                        color: subjectCardTheme.darkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "IV - A",
                      style: TextStyle(
                        color: subjectCardTheme.darkColor.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
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
