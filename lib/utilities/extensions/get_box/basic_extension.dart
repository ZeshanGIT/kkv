import 'package:get_storage/get_storage.dart';

import '../../../common/constants.dart';
import '../../../model/class_model.dart';

extension BasicBoxExtension on GetStorage {
  Future<void> setRole(String role) async {
    await this.write(StoredDetails.ROLE, role);
  }

  String getRole() {
    return this.read(StoredDetails.ROLE);
  }

  String? getUid() {
    return this.read(StoredDetails.USER_ID);
  }

  Future<void> setUid(String uid) async {
    return await this.write(StoredDetails.USER_ID, uid);
  }

  Future<void> setClassList(List<ClassModel> classList) async {
    this.write(StoredDetails.CLASS_LIST, classList);
  }

  List<ClassModel> getClassList() {
    return this.read(StoredDetails.CLASS_LIST);
  }
}
