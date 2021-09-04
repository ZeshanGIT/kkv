import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/model/student.model.dart';
import 'package:kkv/model/user.model.dart';
import 'package:kkv/router/routes.dart';
import 'package:kkv/router/student_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentUserService {
  static final CollectionReference _students =
      FirebaseFirestore.instance.collection(UserRole.STUDENT);

  static Future<void> handleStudentAuth(UserCredential? _userCredential) async {
    final userDoc = await _students.doc(_userCredential?.user!.uid).get();
    if (userDoc.exists) {
      StudentModel _tempStudent =
          StudentModel.fromMap(userDoc.data() as Map<String, dynamic>);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(StoredDetails.ROLE, UserRole.STUDENT);
      prefs.setString(StoredDetails.USER, _tempStudent.toJson());
      prefs.setString(StoredDetails.USER_ID, _tempStudent.id);
      Get.offAndToNamed(StudentRoutes.HOME);
    } else {
      UserModel userModel = UserModel(
        id: _userCredential?.user!.uid ?? '',
        name: _userCredential?.user!.displayName ?? '',
        email: _userCredential?.user!.email ?? '',
        profilePic: _userCredential?.user!.photoURL ?? '',
      );

      Get.toNamed(
        StudentRoutes.SIGNUP,
        arguments: userModel,
      );
    }
  }

  static Future<void> addStudent({
    required UserModel userModel,
    required int grade,
    required String section,
    required String roleNumber,
  }) async {
    final _tempStudent = StudentModel.fromUser(
      userModel: userModel,
      grade: grade,
      section: section,
      roleNumber: roleNumber,
    );
    await _students.doc(userModel.id).set(_tempStudent.toMap());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StoredDetails.ROLE, UserRole.STUDENT);
    prefs.setString(StoredDetails.USER, _tempStudent.toJson());
    prefs.setString(StoredDetails.USER_ID, _tempStudent.id);
  }
}