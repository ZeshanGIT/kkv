import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/constants.dart';
import '../../../../../../common/text_styles.dart';
import '../../../../../../common/widgets/bottom_width_button.dart';
import '../../../../../../common/widgets/top_bar.dart';
import 'add_assignment_controller.dart';

class AddAssignment extends StatelessWidget {
  const AddAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAssignmentController>(
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            Container(
              height: Get.height - 80,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  TopBar(
                    title: "Assignment",
                    leadingIcon: Icons.close_rounded,
                  ),
                  SIZED_BOX_8,
                  Divider(),
                  SIZED_BOX_8,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Title",
                      labelText: "Title",
                    ),
                    onEditingComplete: controller.focusNext,
                  ),
                  SIZED_BOX_16,
                  TextFormField(
                    maxLines: 5,
                    minLines: 2,
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description",
                      alignLabelWithHint: true,
                    ),
                    textAlignVertical: TextAlignVertical.top,
                    onEditingComplete: controller.focusNext,
                  ),
                  SIZED_BOX_16,
                  TextFormField(
                    controller: controller.dueDateController,
                    onTap: controller.pickDueDate,
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today_rounded),
                      hintText: "Due date",
                      labelText: "Due date",
                      alignLabelWithHint: true,
                    ),
                  ),
                  SIZED_BOX_32,
                  Text(
                    "Attachments",
                    style: SMALL_SUB_HEADING,
                  ),
                  SIZED_BOX_16,
                  TextButton.icon(
                    onPressed: controller.addAttachments,
                    icon: Icon(Icons.attach_file_rounded),
                    label: Text("Add attachments"),
                  ),
                  SIZED_BOX_16,
                ],
              ).paddingAll(16),
            ),
            BottomWidthBlackButton(text: "Submit").paddingAll(16),
          ],
        ),
      ),
    );
  }
}
