import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/common/text_styles.dart';

import '../../../../../model/assignment_model.dart';
import '../../classroom_controller.dart';

class AssignmentCard extends GetView<ClassroomController> {
  final AssignmentModel assignmentModel;
  const AssignmentCard(this.assignmentModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: controller.subjectCardTheme.shadowColor.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                assignmentModel.title,
                style: HEADING_TEXT_STYLE,
              ),
              SIZED_BOX_8,
              Text("Assigned " + Jiffy(assignmentModel.assignedAt).fromNow()),
              Text("Due " + Jiffy(assignmentModel.assignedAt).fromNow()),
            ],
          ).paddingAll(16),
        ],
      ),
    ).paddingAll(16);
  }
}
