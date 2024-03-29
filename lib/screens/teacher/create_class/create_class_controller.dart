import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/class_props.dart';
import '../../../model/class_model.dart';
import '../../../model/period_model.dart';
import '../../../router/teacher_routes.dart';
import '../../../utilities/extensions/time_diff.dart';

class CreateClassController extends GetxController {
  String? selectedSubject;
  int? selectedSubjectIndex;

  String? selectedGrade;
  int? selectedGradeIndex;

  String? selectedSection;
  int? selectedSectionIndex;

  List<PeriodModel> timetable = [];
  TextEditingController meetingLinkController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  onMeetingLinkTap() async {
    String tempLink = await FlutterClipboard.paste();
    print("Clipboard link $tempLink");
    if (await canLaunch(tempLink)) {
      Get.dialog(
        AlertDialog(
          title: Text("Paste link from clipboard ?"),
          content: Text(tempLink),
          actions: [
            TextButton(
              onPressed: Get.back,
              child: Text("No"),
            ),
            TextButton(
              onPressed: pasteLinkFromClipboard,
              child: Text("Yes"),
            ),
          ],
        ),
      );
    }

    update();
  }

  pasteLinkFromClipboard() async {
    String tempLink = await FlutterClipboard.paste();
    meetingLinkController.text = tempLink;
    Get.back();
    Get.focusScope?.unfocus();
  }

  addClass(PeriodModel classModel) {
    timetable.add(classModel);
    timetable.sort((a, b) {
      if (a.day != b.day)
        return a.day.index - b.day.index;
      else
        return a.time - b.time;
    });
    update();
  }

  removeClass(PeriodModel classModel) {
    timetable.remove(classModel);
    update();
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

  void _onCreate() {
    ClassModel classModel = ClassModel(
      subject: selectedSubject!,
      grade: selectedGrade!,
      section: selectedSection!,
      description: descriptionController.text,
      meetingLink: meetingLinkController.text,
      timetable: timetable,
    );

    Get.toNamed(
      TeacherRoutes.CLASS_PREVIEW,
      arguments: classModel,
    );
  }

  bool get _isValid {
    return selectedSubject != null &&
        selectedGrade != null &&
        selectedSection != null;
  }

  void onTapAnywhereElse() {
    Get.focusScope?.unfocus();
  }

  void onAddTimetable() {
    Get.toNamed(TeacherRoutes.ADD_TIMETABLE);
  }

  String get gradePostfix => selectedGrade != null ? " Grade" : "";
  String get sectionPostfix => selectedSection != null ? " Section" : "";
}
