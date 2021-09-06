import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants.dart';
import '../../../model/student.model.dart';
import '../get_box/student_box_extension.dart';
import 'basic_extension.dart';

extension StudentModelSharedPreferencesExtension on SharedPreferences {
  static final GetStorage _box = GetStorage();
  StudentModel? getStudent() {
    String? _student = this.getString(StoredDetails.USER);
    if (_student == null) return null;
    return StudentModel.fromJson(_student);
  }

  Future<bool?> setStudent(StudentModel studentModel) async {
    _box.setStudent(studentModel);
    this.setRole(UserRole.STUDENT);
    this.setUid(studentModel.id);
    return await this.setString(StoredDetails.USER, studentModel.toJson());
  }
}
