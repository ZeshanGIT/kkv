import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:kkv/model/class_model.dart';
import 'package:kkv/screens/teacher/create_class/create_class_controller.dart';
import 'package:supercharged/supercharged.dart';
import 'package:get/get.dart';

class AddClassController extends GetxController {
  bool isClassFormVisible = false;

  Day? selectedDay;
  int? selectedDayIndex;

  TimeOfDay? _selectedTimeOfDay;
  String? get selectedTimeOfDay => _selectedTimeOfDay != null
      ? "${_selectedTimeOfDay!.hourOfPeriod} : ${_selectedTimeOfDay!.minute.toString().padLeft(2, '0')} ${_selectedTimeOfDay!.period.toString().split('.')[1].toUpperCase()}"
      : null;

  final createClassController = Get.find<CreateClassController>();

  onSelectedDay(Day day, int i, BuildContext _) {
    selectedDay = day;
    selectedDayIndex = i;
    update();
  }

  Function() onAddTime(BuildContext context) {
    return () async {
      TimeOfDay? temp = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          DateTime.now().subtract(TimeOfDay.now().minute.minutes),
        ),
      );
      _selectedTimeOfDay = temp ?? _selectedTimeOfDay;
      update();
    };
  }

  void toggleClassForm() {
    isClassFormVisible = !isClassFormVisible;
    update();
  }

  Function()? onSubmit() {
    if (_selectedTimeOfDay == null || selectedDay == null) return null;
    return () {
      ClassModel tempModel =
          ClassModel(day: selectedDay!, time: _selectedTimeOfDay!);
      print(tempModel);
      // isClassFormVisible = false;
      // createClassController
      //     .addClass(ClassModel(day: selectedDay!, time: _selectedTimeOfDay!));
    };
  }
}
