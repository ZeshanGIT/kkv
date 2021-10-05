import 'package:clipboard/clipboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kkv/services/assignment_service.dart';

import '../../../../../../model/attachment_model.dart';
import 'attachment_type_bottom_sheet.dart';
import 'link_picker.dart';

class AddAssignmentController extends GetxController {
  TextEditingController dueDateController = TextEditingController();
  String title = "";
  String desc = "";
  DateTime? dueDate;

  List<AttachmentModel> attachments = [];
  FirebaseStorage storage = FirebaseStorage.instance;

  addAttachment(AttachmentModel attachmentModel) {
    attachments.add(attachmentModel);
    update();
  }

  removeAttachment(AttachmentModel attachmentModel) {
    attachments.remove(attachmentModel);
    update();
  }

  pickDueDate() async {
    DateTime? _dueDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(365.days),
    );
    if (_dueDate == null) return;
    TimeOfDay? timeOfDay = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay(
          hour: 11,
          minute: 59,
        ));
    if (timeOfDay == null) return;
    _dueDate = DateTime.utc(_dueDate.year, _dueDate.month, _dueDate.day,
        timeOfDay.hour, timeOfDay.minute);
    dueDate = _dueDate;
    dueDateController.text = Jiffy(dueDate).yMMMMEEEEdjm;
    update();
  }

  focusNext() {
    Get.focusScope?.nextFocus();
  }

  pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true,
    );
    if (result == null) return;
    result.files.forEach(
      (f) => addAttachment(
        AttachmentModel(title: f.name, type: AttachmentModel.VIDEO, file: f),
      ),
    );
    Get.back();
  }

  pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result == null) return;
    result.files.forEach(
      (f) => addAttachment(
        AttachmentModel(title: f.name, type: AttachmentModel.DOCUMENT, file: f),
      ),
    );
    Get.back();
  }

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result == null) return;
    result.files.forEach(
      (f) => addAttachment(
        AttachmentModel(
          title: f.name,
          type: AttachmentModel.IMAGE,
          file: f,
        ),
      ),
    );
    Get.back();
  }

  final TextEditingController linkController = TextEditingController();

  bool isURL = false;

  pickLink() async {
    String clipContent = await FlutterClipboard.paste();
    isURL = GetUtils.isURL(clipContent);
    linkController.clear();
    Get.dialog(LinkPicker());
  }

  void openAttachmentBottomSheet() {
    Get.bottomSheet(AttachmentTypeBottomSheet());
  }

  onTitleChanged(String _title) {
    title = _title;
    update();
  }

  onDescChanged(String _desc) {
    desc = _desc;
    update();
  }

  _onSubmit() {
    AssignmentService().addAssignment(title, desc, attachments, dueDate!);
  }

  Function()? get onSubmit => isValid ? _onSubmit : null;

  bool get isValid => title != "" && dueDate != null;
}
