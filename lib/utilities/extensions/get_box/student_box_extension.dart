import 'package:get_storage/get_storage.dart';

import '../../../common/constants.dart';
import '../../../model/student.model.dart';
import 'basic_extension.dart';

extension StudentModelSharedPreferencesExtension on GetStorage {
  StudentModel? getStudent() {
    String? _student = this.read(StoredDetails.USER);
    if (_student == null) return null;
    return StudentModel.fromJson(_student);
  }

  Future<void> setStudent(StudentModel studentModel) async {
    this.setRole(UserRole.STUDENT);
    this.setUid(studentModel.id);
    return await this.write(StoredDetails.USER, studentModel.toJson());
  }
}
