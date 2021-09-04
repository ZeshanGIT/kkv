import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants.dart';
import '../../../model/teacher.model.dart';
import 'basic_extension.dart';

extension TeacherModelSharedPreferencesExtension on SharedPreferences {
  TeacherModel? getTeacher() {
    String? _teacher = this.getString(StoredDetails.USER);
    if (_teacher == null) return null;
    return TeacherModel.fromJson(_teacher);
  }

  Future<bool?> setTeacher(TeacherModel teacherModel) async {
    this.setRole(UserRole.TEACHER);
    this.setUid(teacherModel.id);
    return await this.setString(StoredDetails.USER, teacherModel.toJson());
  }
}
