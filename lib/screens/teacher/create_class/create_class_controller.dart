import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class CreateClassController extends GetxController
    with SingleGetTickerProviderMixin {
  String? selectedSubject;
  int? selectedSubjectIndex;

  String? selectedGrade;
  int? selectedGradeIndex;

  String? selectedSection;
  int? selectedSectionIndex;

  Function()? onCreate;

  late AnimationController _placeHolderColorAnimationController =
      AnimationController(
    vsync: this,
    duration: 500.milliseconds,
  );
  late Animation<Color?> placeHolderColorAnimation = Colors.black45
      .tweenTo(Colors.black)
      .animatedBy(_placeHolderColorAnimationController);

  final SUBJECTS = [
    "Select Subject",
    "Physics",
    "Chemistry",
    "Biology",
    "Mathematics",
    "Social Science",
    "English",
    "Tamil",
    "Sanskrit",
    "Hindi"
  ];

  final GRADES = [
    "Select Grade",
    "I",
    "II",
    "III",
    "IV",
    "V",
    "VI",
    "VII",
    "VIII",
    "IX",
    "X"
  ];

  final SECTION = ["Select Section", "A", "B", "C", "D", "E", "F"];

  onGradeSelected(String grade, int index) {
    selectedGrade = grade;
    selectedGradeIndex = index;
    _setOnCreate();
  }

  onSubjectSelected(String sub, int index) {
    selectedSubject = sub;
    selectedSubjectIndex = index;
    _setOnCreate();
  }

  onSectionSelected(String sec, int index) {
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
    _placeHolderColorAnimationController.forward();
  }
}
