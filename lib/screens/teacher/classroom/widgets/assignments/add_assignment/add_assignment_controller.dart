import 'package:clipboard/clipboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kkv/screens/teacher/classroom/widgets/assignments/add_assignment/link_picker.dart';

import '../../../../../../common/constants.dart';
import '../../../../../../common/text_styles.dart';
import 'attachment_type_bottom_sheet.dart';

class AddAssignmentController extends GetxController {
  TextEditingController dueDateController = TextEditingController();

  pickDueDate() async {
    DateTime? dueDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(365.days),
    );
    if (dueDate == null) return;
    TimeOfDay? timeOfDay = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay(
          hour: 11,
          minute: 59,
        ));
    if (timeOfDay == null) return;
    dueDate = DateTime.utc(dueDate.year, dueDate.month, dueDate.day,
        timeOfDay.hour, timeOfDay.minute);
    dueDateController.text = Jiffy(dueDate).fromNow();
  }

  focusNext() {
    Get.focusScope?.nextFocus();
  }

  closeAssignmentSheet() {
    Get.back();
    dueDateController.clear();
  }

  pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true,
    );
    if (result == null) return;
    result.files.forEach((f) => print(f.path));
    Get.back();
  }

  pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result == null) return;
    Get.back();
    result.files.forEach((f) => print(f.path));
  }

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result == null) return;
    Get.back();
    result.files.forEach((f) => print(f.path));
  }

  final TextEditingController linkController = TextEditingController();

  bool isURL = false;

  pickLink() async {
    String clipContent = await FlutterClipboard.paste();
    isURL = GetUtils.isURL(clipContent);
    linkController.clear();
    Get.dialog(LinkPicker());
  }

  void addAttachments() {
    Get.bottomSheet(AttachmentTypeBottomSheet());
  }
}
