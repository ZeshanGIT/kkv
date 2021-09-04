import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kkv/assets/common_asset.dart';
import 'package:kkv/screens/teacher/home/teacher_home_controller.dart';

import '../../../common/constants.dart';

class TeacherFloatingDrawer extends GetView<TeacherHomeController> {
  const TeacherFloatingDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2,
        sigmaY: 2,
      ),
      child: Container(
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 256,
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    controller.user!.profilePic,
                    height: 64,
                  ),
                ),
                SIZED_BOX_16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.user!.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.user!.empId,
                      style: TextStyle(
                        color: Color(0xFF4B4F79),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SIZED_BOX_64,
            InkWell(
              onTap: controller.onCreateClass,
              child: Row(
                children: [
                  Icon(Icons.edit),
                  SIZED_BOX_16,
                  Text("Create class"),
                ],
              ),
            ),
            SIZED_BOX_32,
            InkWell(
              onTap: controller.logout,
              child: Row(
                children: [
                  Icon(Icons.meeting_room_rounded),
                  SIZED_BOX_16,
                  Text("Logout"),
                ],
              ),
            ),
            Spacer(),
            SvgPicture.asset(CommonAsset.DRAWER_BOTTOM_ILLUS),
          ],
        ).paddingAll(24),
      ),
    );
  }
}
