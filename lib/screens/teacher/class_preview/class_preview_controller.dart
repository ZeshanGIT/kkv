import 'package:get/get.dart';
import 'package:kkv/services/teacher_class_service.dart';

class ClassPreviewController extends GetxController {
  onSubmit() {
    TeacherClassService.createClass(Get.arguments);
  }
}
