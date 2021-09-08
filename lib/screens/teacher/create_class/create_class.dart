import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/screens/add_timetable/widgets/class_card.dart';

import '../../../common/class_props.dart';
import '../../../common/constants.dart';
import '../../../common/text_styles.dart';
import '../../../common/widgets/bottom_width_button.dart';
import '../../../common/widgets/top_bar.dart';
import 'create_class_controller.dart';
import '../../../utilities/extensions/with_padding.dart';

class CreateClass extends StatelessWidget {
  const CreateClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateClassController>(
      builder: (controller) => GestureDetector(
        onTap: controller.onTapAnywhereElse(context),
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: Get.height - 32,
              child: DirectSelectContainer(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height - 80,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          TopBar(
                            title: "Create Class",
                          ),
                          ...[
                            SIZED_BOX_32,
                            Text("Long press and move to select"),
                            SIZED_BOX_16,
                            Divider(),
                            SIZED_BOX_16,
                            Text(
                              "Grade",
                              style: SMALL_SUB_HEADING,
                            ),
                            DirectSelectList<String>(
                              values: ClassProps.GRADES.keys.toList(),
                              defaultItemIndex:
                                  controller.selectedGradeIndex ?? 0,
                              itemBuilder: (grade) => getDropDownMenuItem(
                                grade,
                                postfix: controller.gradePostfix,
                              ),
                              focusedItemDecoration: _getDslDecoration(),
                              onItemSelectedListener:
                                  controller.onGradeSelected,
                            ),
                            SIZED_BOX_16,
                            Text(
                              "Section",
                              style: SMALL_SUB_HEADING,
                            ),
                            DirectSelectList<String>(
                              values: ClassProps.SECTIONS,
                              defaultItemIndex:
                                  controller.selectedSectionIndex ?? 0,
                              itemBuilder: (sec) => getDropDownMenuItem(
                                sec,
                                prefix: controller.sectionPrefix,
                              ),
                              focusedItemDecoration: _getDslDecoration(),
                              onItemSelectedListener:
                                  controller.onSectionSelected,
                            ),
                            SIZED_BOX_16,
                            Text(
                              "Subject",
                              style: SMALL_SUB_HEADING,
                            ),
                            DirectSelectList<String>(
                              values: controller.subjects,
                              defaultItemIndex:
                                  controller.selectedSubjectIndex ?? 0,
                              itemBuilder: (sub) => getDropDownMenuItem(sub),
                              focusedItemDecoration: _getDslDecoration(),
                              onItemSelectedListener:
                                  controller.onSubjectSelected,
                            ),
                            SIZED_BOX_8,
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Description",
                                labelText: "Description",
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                alignLabelWithHint: true,
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                            ),
                            SIZED_BOX_32,
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
                            OutlinedButton(
                              onPressed: controller.onAddTimetable,
                              child: Text(
                                  "Tap to ${controller.timetable.isEmpty ? 'add' : 'edit'} timetable"),
                            ),
                            SIZED_BOX_16,
                            ...controller.timetable
                                .map((classModel) => ClassCard(classModel))
                                .toList(),
                            SIZED_BOX_32,
                          ].withSymmetricPadding(16),
                        ],
                      ),
                    ),
                    Spacer(),
                    BottomWidthBlackButton(
                      text: "Create",
                      onPressed: controller.onCreate,
                    ),
                  ],
                ),
              ),
            ),
          ).paddingAll(16),
        ),
      ),
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String val,
      {String prefix = "", String postfix = ""}) {
    return DirectSelectItem<String>(
      itemHeight: 56,
      value: val,
      itemBuilder: (context, section) {
        return Text("$prefix$section$postfix");
      },
    );
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }
}
