import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/constants.dart';
import '../../../../common/text_styles.dart';
import '../../../../model/period_model.dart';
import '../../../../utilities/extensions/time_of_day_readable.dart';
import '../../create_class/create_class_controller.dart';

class PeriodCard extends StatelessWidget {
  final PeriodModel classModel;
  final bool isDismissible;
  const PeriodCard(
    this.classModel, {
    Key? key,
    this.isDismissible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateClassController>(
      builder: (createClassController) => isDismissible
          ? Dismissible(
              onDismissed: (_) => createClassController.removeClass(classModel),
              key: Key(classModel.toString()),
              child: _buildCard(),
            )
          : _buildCard(),
    );
  }

  _buildCard() {
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

extension TimetableToPeriodCard on List<PeriodModel> {
  List<Widget> toPeriodCards({bool isDismissible = false}) {
    return this
        .map((p) => PeriodCard(
              p,
              isDismissible: isDismissible,
            ))
        .toList();
  }
}
