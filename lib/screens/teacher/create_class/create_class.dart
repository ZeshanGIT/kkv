import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          body: DirectSelectContainer(
            child: Container(
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      values: controller.GRADES,
                      defaultItemIndex: controller.selectedGradeIndex ?? 0,
                      itemBuilder: (String value) => getDropDownMenuItem(value),
                      focusedItemDecoration: _getDslDecoration(),
                      onItemSelectedListener: (grade, index, context) {
                        controller.onGradeSelected(grade, index);
                      },
                    ),
                    SIZED_BOX_16,
                    Text(
                      "Section",
                      style: SMALL_SUB_HEADING,
                    ),
                    DirectSelectList<String>(
                      values: controller.SECTION,
                      defaultItemIndex: controller.selectedSectionIndex ?? 0,
                      itemBuilder: (String value) => getDropDownMenuItem(value),
                      focusedItemDecoration: _getDslDecoration(),
                      onItemSelectedListener: (section, index, context) {
                        controller.onSectionSelected(section, index);
                      },
                    ),
                    SIZED_BOX_16,
                    Text(
                      "Subject",
                      style: SMALL_SUB_HEADING,
                    ),
                    DirectSelectList<String>(
                      values: controller.SUBJECTS,
                      defaultItemIndex: controller.selectedSubjectIndex ?? 0,
                      itemBuilder: (String value) => getDropDownMenuItem(value),
                      focusedItemDecoration: _getDslDecoration(),
                      onItemSelectedListener: (subject, index, context) {
                        controller.onSubjectSelected(subject, index);
                      },
                    ),
                    SIZED_BOX_16,
                    Text(
                      "Description",
                      style: SMALL_SUB_HEADING,
                    ),
                    SIZED_BOX_16,
                    TextFormField(
                      scrollPhysics: BouncingScrollPhysics(),
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                    ),
                  ]),
                  Spacer(),
                  BottomWidthBlackButton(
                    text: "Create",
                    onPressed: controller.onCreate,
                  ),
                ],
              ).paddingAll(16),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> listWithPadding(List<Widget> widgets) {
    return widgets.map((w) => w.paddingSymmetric(horizontal: 16)).toList();
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
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
