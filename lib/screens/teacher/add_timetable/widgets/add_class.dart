import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../../common/constants.dart';
import '../../../../common/text_styles.dart';
import '../../../../model/period_model.dart';
import '../../create_class/create_class_controller.dart';
import 'add_class_controller.dart';

class AddClass extends StatelessWidget {
  const AddClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateClassController>(
      builder: (createClassController) => GetBuilder<AddClassController>(
        builder: (controller) => controller.isClassFormVisible
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Day",
                                style: SMALL_SUB_HEADING,
                              ),
                              DirectSelectList<Day>(
                                values: Day.values.toList(),
                                defaultItemIndex:
                                    controller.selectedDayIndex ?? 0,
                                itemBuilder: (day) => getDayMenuItem(
                                  day,
                                ),
                                focusedItemDecoration: _getDslDecoration(),
                                onItemSelectedListener:
                                    controller.onSelectedDay,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Class starts at",
                                style: SMALL_SUB_HEADING,
                              ),
                              SIZED_BOX_8,
                              OutlinedButton(
                                onPressed: controller.onAddTime,
                                child: Text(
                                  controller.selectedTimeOfDay != null
                                      ? controller.selectedTimeOfDay!
                                      : "Choose time",
                                  style: controller.selectedTimeOfDay != null
                                      ? HEADING_TEXT_STYLE
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SIZED_BOX_8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                          onPressed: controller.onSubmit(),
                          icon: Icon(
                            Icons.check_rounded,
                            color: Colors.green,
                          ),
                          label: Text(
                            "Submit",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: controller.toggleClassForm,
                          icon: Icon(Icons.close, color: Colors.red),
                          label: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  ],
                ).paddingAll(16),
              )
            : Container(
                alignment: Alignment.center,
                child: OutlinedButton.icon(
                  onPressed: controller.toggleClassForm,
                  icon: Icon(Icons.add_circle_rounded),
                  label: Text("Add Class"),
                ),
              ),
      ),
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

  DirectSelectItem<Day> getDayMenuItem(Day val) {
    return DirectSelectItem<Day>(
      itemHeight: 56,
      value: val,
      itemBuilder: (context, day) {
        if (day == Day.SelectDay) return Text("Select Day");
        return Text(day.toString().split(".")[1]);
      },
    );
  }
}
