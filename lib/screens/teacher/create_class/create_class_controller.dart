import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkv/common/class_props.dart';

class CreateClassController extends GetxController {
  String? selectedSubject;
  int? selectedSubjectIndex;

  String? selectedGrade;
  int? selectedGradeIndex;

  String? selectedSection;
  int? selectedSectionIndex;

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
      // _placeHolderColorAnimationController.reverse();
      // print("On Tap Anywhere else");
    };
  }

  void onDescTap() {
    // _placeHolderColorAnimationController.forward();
  }
}
