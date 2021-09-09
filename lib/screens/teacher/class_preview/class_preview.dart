import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/constants.dart';
import '../../../../common/text_styles.dart';
import '../../../../common/widgets/top_bar.dart';
import '../../../../model/class_model.dart';
import '../../../../utilities/extensions/with_padding.dart';
import '../../../common/widgets/bottom_width_button.dart';
import '../add_timetable/widgets/period_card.dart';
import 'class_preview_controller.dart';

class ClassPreview extends GetView<ClassPreviewController> {
  const ClassPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClassModel classModel = Get.arguments as ClassModel;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height - 80,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                TopBar(
                  title: "Class Preview",
                  leadingIcon: Icons.close_rounded,
                ),
                ...<Widget>[
                  SIZED_BOX_32,
                  Text(
                      "Grade, Section and Subject cannot be edited later. Other fields can be edited in the future."),
                  SIZED_BOX_16,
                  Divider(),
                  SIZED_BOX_24,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Grade",
                              style: SMALL_SUB_HEADING,
                            ),
                            SIZED_BOX_8,
                            Text(classModel.grade + " Grade"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Section",
                              style: SMALL_SUB_HEADING,
                            ),
                            SIZED_BOX_8,
                            Text(classModel.section + " Section"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SIZED_BOX_24,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Subject",
                        style: SMALL_SUB_HEADING,
                      ),
                      SIZED_BOX_8,
                      Text(classModel.subject),
                    ],
                  ),
                  SIZED_BOX_24,
                  if (classModel.description != "")
                    TextFormField(
                      initialValue: classModel.description,
                      maxLines: 3,
                      readOnly: true,
                      decoration: InputDecoration(labelText: "Description"),
                    ),
                  SIZED_BOX_24,
                  if (classModel.meetingLink != "") ...[
                    TextFormField(
                      initialValue: classModel.meetingLink,
                      maxLines: 1,
                      readOnly: true,
                      decoration: InputDecoration(labelText: "Meeting Link"),
                    ),
                    SIZED_BOX_8,
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tap to open link",
                        style: SMALL_SUB_HEADING,
                      ),
                    ),
                    SIZED_BOX_16,
                    if (classModel.timetable.isNotEmpty) ...[
                      Text(
                        "Timetable",
                        style: SUB_HEADING,
                      ),
                      SIZED_BOX_8,
                      Text(
                        "Students will be notified before the class starts",
                        style: SMALL_SUB_HEADING,
                      ),
                      SIZED_BOX_16,
                      ...classModel.timetable.toPeriodCards(),
                    ]
                  ],
                ].withSymmetricPadding(),
                SIZED_BOX_32,
              ],
            ),
          ),
          BottomWidthBlackButton(
            text: "Submit",
            onPressed: controller.onSubmit,
          ),
        ],
      ).paddingAll(16),
    );
  }
}
