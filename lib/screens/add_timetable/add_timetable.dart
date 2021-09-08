import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/screens/add_timetable/widgets/class_card.dart';

import '../../common/constants.dart';
import '../../common/widgets/top_bar.dart';
import '../../utilities/extensions/with_padding.dart';
import '../teacher/create_class/create_class_controller.dart';
import 'widgets/add_class.dart';

class AddTimetable extends StatelessWidget {
  const AddTimetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateClassController>(
      builder: (createClassController) => DirectSelectContainer(
        child: Scaffold(
          body: ListView(
            children: [
              TopBar(
                title: "Add Timetable",
                leadingIcon: Icons.close_rounded,
              ),
              ...[
                SIZED_BOX_32,
                Text("Students will be notified before the class starts"),
                SIZED_BOX_16,
                Divider(),
                SIZED_BOX_16,
                AddClass(),
                SIZED_BOX_16,
                ...createClassController.timetable
                    .map((classModel) => ClassCard(classModel))
                    .toList()
              ].withSymmetricPadding(16),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
