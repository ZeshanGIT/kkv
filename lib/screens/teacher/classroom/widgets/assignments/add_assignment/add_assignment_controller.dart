import 'package:clipboard/clipboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

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

  pickLink() async {
    String clipContent = await FlutterClipboard.paste();
    linkController.clear();
    Get.dialog(
      AlertDialog(
        title: Text("Paste link here"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (GetUtils.isURL(clipContent)) ...[
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => linkController.text = clipContent,
                  child: Text("Paste from clipboard"),
                ),
              ),
              Text(
                clipContent,
                style: SMALL_SUB_HEADING,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ).paddingOnly(left: 8)
            ],
            SIZED_BOX_16,
            TextFormField(
              controller: linkController,
              autocorrect: false,
              validator: (link) =>
                  GetUtils.isURL(link ?? '') ? null : "Invalid URL",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "Link",
                labelText: "Link",
              ),
            ),
            SIZED_BOX_16,
            OutlinedButton(
              onPressed: Get.back,
              child: Text(
                "Submit",
                style: SUB_HEADING,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addAttachments() {
    Get.bottomSheet(AttachmentTypeBottomSheet());
  }
}
