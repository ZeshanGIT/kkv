import 'package:get_storage/get_storage.dart';

import '../../../common/constants.dart';
import '../../../model/teacher.model.dart';
import 'basic_extension.dart';

extension TeacherModelSharedPreferencesExtension on GetStorage {
  TeacherModel? getTeacher() {
    String? _teacher = this.read(StoredDetails.USER);
    if (_teacher == null) return null;
    return TeacherModel.fromJson(_teacher);
  }

  Future<void> setTeacher(TeacherModel teacherModel) async {
    this.setRole(UserRole.TEACHER);
    this.setUid(teacherModel.id);
    return await this.write(StoredDetails.USER, teacherModel.toJson());
  }
}
