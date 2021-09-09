import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

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

  pickVideo() {}
  pickDocument() {}
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
  }

  pickLink() {}

  void addAttachments() {
    Get.bottomSheet(AttachmentTypeBottomSheet());
  }
}
