import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../assets/get_started.dart';
import '../../common/constants.dart';
import '../../common/text_styles.dart';
import '../../common/widgets/bottom_width_button.dart';
import '../../router/routes.dart';

class GetStartedPage extends StatelessWidget {
  GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SIZED_BOX_MAX_WIDTH,
          buildGetStartedImage(),
          SIZED_BOX_24,
          Hero(
            tag: "student-management",
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                "Student Management",
                style: STUDENT_MANAGEMENT_TEXT_STYLE,
              ),
            ),
          ),
          Spacer(),
          BottomWidthBlackButton(
            text: "Get started",
            onPressed: () => Get.toNamed(Routes.TEACHER_OR_STUDENT),
          ).paddingAll(24),
        ],
      ),
    );
  }

  Widget buildGetStartedImage() {
    return Container(
      width: Get.width - 96,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFF5281A2).withOpacity(0.2),
          offset: Offset(0, 6),
          blurRadius: 20,
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: SvgPicture.asset(
          GetStartedAssets.getStartedImg,
          width: Get.width - 96,
        ),
      ),
    ).paddingOnly(top: 32);
  }
}
