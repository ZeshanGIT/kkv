import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kkv/utilities/extensions/time_diff.dart';
import '../../../common/class_props.dart';
import '../../../model/class_model.dart';
import '../../../router/teacher_routes.dart';

class CreateClassController extends GetxController {
  String? selectedSubject;
  int? selectedSubjectIndex;

  String? selectedGrade;
  int? selectedGradeIndex;

  String? selectedSection;
  int? selectedSectionIndex;

  List<ClassModel> timetable = [];

  addClass(ClassModel classModel) {
    timetable.add(classModel);
    timetable.sort((a, b) {
      if (a.day != b.day)
        return a.day.index - b.day.index;
      else
        return a.time - b.time;
    });
    update();
    print(timetable);
  }

  Function()? onCreate;

  List<String> get subjects =>
      ClassProps.GRADES[selectedGrade ?? ClassProps.SELECT_GRADE] ?? [];

  onGradeSelected(String grade, int index, BuildContext _) {
    selectedSubject = selectedSubjectIndex = null;
    selectedGrade = grade;
    selectedGradeIndex = index;
    _setOnCreate();
  }

  onSubjectSelected(String sub, int index, BuildContext _) {
    selectedSubject = sub;
    selectedSubjectIndex = index;
    _setOnCreate();
  }

  onSectionSelected(String sec, int index, BuildContext _) {
    selectedSection = sec;
    selectedSectionIndex = index;
    _setOnCreate();
  }

  void _setOnCreate() {
    onCreate = _isValid ? _onCreate : null;
    update();
  }

  bool get _isValid {
    return selectedSubject != null &&
        selectedGrade != null &&
        selectedSection != null;
  }

  void _onCreate() {}

  void Function() onTapAnywhereElse(BuildContext context) {
    return () {
      FocusScope.of(context).unfocus();
    };
  }

  void onAddTimetable() {
    Get.toNamed(TeacherRoutes.ADD_TIMETABLE);
  }

  String get gradePostfix => selectedGrade != null ? " Grade" : "";
  String get sectionPrefix => selectedSection != null ? "Section " : "";
}
