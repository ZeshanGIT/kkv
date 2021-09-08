import 'package:get/get.dart';
import 'package:kkv/screens/teacher/class_preview/class_preview_controller.dart';

class ClassPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClassPreviewController());
  }
}
