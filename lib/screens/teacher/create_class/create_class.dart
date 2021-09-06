import 'dart:ui';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/common/class_props.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../common/constants.dart';
import '../../../common/text_styles.dart';
import '../../../common/widgets/bottom_width_button.dart';
import '../../../common/widgets/top_bar.dart';
import 'create_class_controller.dart';

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
                          Text(
                            "Long press and move to select",
                          ).paddingAll(16),
                          Divider(),
                          SIZED_BOX_16,
                          ...listWithPadding([
                            Text(
                              "Grade",
                              style: SMALL_SUB_HEADING,
                            ),
                            DirectSelectList<String>(
                              values: ClassProps.GRADES.keys.toList(),
                              defaultItemIndex:
                                  controller.selectedGradeIndex ?? 0,
                              itemBuilder: getDropDownMenuItem,
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
                              itemBuilder: getDropDownMenuItem,
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
                              itemBuilder: (String value) =>
                                  getDropDownMenuItem(value),
                              focusedItemDecoration: _getDslDecoration(),
                              onItemSelectedListener:
                                  controller.onSubjectSelected,
                            ),
                            SIZED_BOX_16,
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
                          ]),
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

  List<Widget> listWithPadding(List<Widget> widgets) {
    return widgets.map((w) => w.paddingSymmetric(horizontal: 16)).toList();
  }

  DirectSelectItem<String> getDropDownMenuItem(String sec) {
    return DirectSelectItem<String>(
      itemHeight: 56,
      value: sec,
      itemBuilder: (context, section) {
        return Text(section);
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
