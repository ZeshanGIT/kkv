import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants.dart';
import '../../../common/text_styles.dart';
import '../../../model/class_model.dart';
import '../../../utilities/extensions/time_of_day_readable.dart';

class ClassCard extends StatelessWidget {
  final ClassModel classModel;
  const ClassCard(this.classModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Day", style: SMALL_SUB_HEADING),
                SIZED_BOX_8,
                Text(classModel.day.toString().split('.')[1]),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Time", style: SMALL_SUB_HEADING),
                SIZED_BOX_8,
                Text(classModel.time.toReadableString() ?? ''),
              ],
            ),
          )
        ],
      ).paddingAll(16),
    ).paddingSymmetric(vertical: 4);
  }
}
