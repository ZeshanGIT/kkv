import 'package:get/get.dart';

class CreateClassController extends GetxController {
  String? selectedSubject;
  int? selectedSubjectIndex;

  String? selectedGrade;
  int? selectedGradeIndex;

  String? selectedSection;
  int? selectedSectionIndex;

  Function()? onCreate;

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

  void onTapAnywhereElse() {}
}
