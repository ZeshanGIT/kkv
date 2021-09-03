import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/model/teacher.model.dart';
import 'package:kkv/model/user.model.dart';
import 'package:kkv/router/routes.dart';

class TeacherUserService {
  static final CollectionReference _teachers =
      FirebaseFirestore.instance.collection(UserRole.TEACHER);
  static final GetStorage _box = GetStorage();

  static Future<void> handleTeacherAuth(UserCredential? _userCredential) async {
    final userDoc = await _teachers.doc(_userCredential?.user!.uid).get();
    if (userDoc.exists) {
      _box.write("role", UserRole.TEACHER);
      _box.write(
        "user",
        TeacherModel.fromMap(
          userDoc.data() as Map<String, dynamic>,
        ),
      );
      Get.offAndToNamed(Routes.HOME);
    } else {
      UserModel userModel = UserModel(
        id: _userCredential?.user!.uid ?? '',
        name: _userCredential?.user!.displayName ?? '',
        email: _userCredential?.user!.email ?? '',
        profilePic: _userCredential?.user!.photoURL ?? '',
      );

      Get.toNamed(
        Routes.TEACHER_SIGNUP,
        arguments: userModel,
      );
    }
  }

  static Future<void> addTeacher(UserModel _userModel, String? empId) async {
    final _tempTeacher = TeacherModel.fromUser(_userModel, empId ?? '');
    await _teachers.doc(_userModel.id).set(_tempTeacher.toMap());
    _box.write("role", UserRole.TEACHER);
    _box.write("user", _tempTeacher);
    Get.toNamed(Routes.HOME);
  }
}
