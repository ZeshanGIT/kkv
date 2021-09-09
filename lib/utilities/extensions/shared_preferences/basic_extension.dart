import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants.dart';
import '../../../model/class_model.dart';
import '../get_box/basic_extension.dart';

extension BasicSharedPreferenceExtension on SharedPreferences {
  String? getRole() {
    return this.getString(StoredDetails.ROLE);
  }

  Future<bool?> setRole(String role) async {
    return await this.setString(StoredDetails.ROLE, role);
  }

  String? getUid() {
    return this.getString(StoredDetails.USER_ID);
  }

  Future<bool?> setUid(String uid) async {
    return await this.setString(StoredDetails.USER_ID, uid);
  }

  Future<bool?> addToClassList(ClassModel newClass) async {
    List<ClassModel> classList = [...this.getClassList(), newClass];
    final GetStorage _box = GetStorage();
    _box.setClassList(classList);
    return await this.setStringList(
      StoredDetails.CLASS_LIST,
      classList.map((c) => c.toJson()).toList(),
    );
  }

  Future<bool?> setClassList(List<ClassModel> classList) async {
    final GetStorage _box = GetStorage();
    _box.setClassList(classList);
    return await this.setStringList(
      StoredDetails.CLASS_LIST,
      classList.map((c) => c.toJson()).toList(),
    );
  }

  List<ClassModel> getClassList() {
    return this
            .getStringList(StoredDetails.CLASS_LIST)
            ?.map((c) => ClassModel.fromJson(c))
            .toList() ??
        [];
  }
}
