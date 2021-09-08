import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/constants.dart';
import '../model/teacher.model.dart';
import '../model/user.model.dart';
import '../router/teacher_routes.dart';
import '../utilities/extensions/shared_preferences/teacher_sp_extension.dart';

class TeacherUserService {
  static final CollectionReference _teachers =
      FirebaseFirestore.instance.collection(FirestoreCollections.TEACHER);

  static Future<void> handleTeacherAuth(UserCredential? _userCredential) async {
    final userDoc = await _teachers.doc(_userCredential?.user!.uid).get();
    if (userDoc.exists) {
      TeacherModel _tempTeacher =
          TeacherModel.fromMap(userDoc.data() as Map<String, dynamic>);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setTeacher(_tempTeacher);
      Get.offAllNamed(TeacherRoutes.HOME);
    } else {
      UserModel userModel = UserModel(
        id: _userCredential?.user!.uid ?? '',
        name: _userCredential?.user!.displayName ?? '',
        email: _userCredential?.user!.email ?? '',
        profilePic: _userCredential?.user!.photoURL ?? '',
      );

      Get.toNamed(
        TeacherRoutes.SIGNUP,
        arguments: userModel,
      );
    }
  }

  static Future<void> addTeacher(UserModel _userModel, String? empId) async {
    final _tempTeacher = TeacherModel.fromUser(_userModel, empId ?? '');
    await _teachers.doc(_userModel.id).set(_tempTeacher.toMap());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setTeacher(_tempTeacher);
    Get.toNamed(TeacherRoutes.HOME);
  }
}
