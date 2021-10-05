import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/constants.dart';
import '../model/class_model.dart';
import '../router/teacher_routes.dart';
import '../utilities/extensions/get_box/basic_extension.dart';
import '../utilities/extensions/shared_preferences/basic_extension.dart';

class TeacherClassService {
  static final _class =
      FirebaseFirestore.instance.collection(FirestoreCollections.CLASS);
  static final _teacher =
      FirebaseFirestore.instance.collection(FirestoreCollections.TEACHER);
  static final GetStorage _box = GetStorage();

  static Future<void> createClass(ClassModel classModel) async {
    QuerySnapshot snapshot =
        (await _class.where("classId", isEqualTo: classModel.classId).get());

    snapshot.docs.forEach(print);

    if (snapshot.size.isGreaterThan(0)) {
      Get.dialog(
        AlertDialog(
          title: Text("Class already exists"),
          content: Text(
            "Tap ok to continue\n\n${classModel.subject}\n${classModel.grade} - ${classModel.section}\n",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: Text("Ok"),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    } else {
      DocumentReference newClassDoc = await _class.add(classModel.toMap());
      _teacher.doc(_box.getUid()).update({
        FirestoreCollections.CLASS: FieldValue.arrayUnion([newClassDoc.id])
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      classModel.docId = newClassDoc.id;
      await prefs.addToClassList(classModel);
      Get.offAllNamed(TeacherRoutes.HOME);
    }
  }

  static Future<List<ClassModel>> fetchClasses() async {
    List<String> classes = (((await _teacher.doc(_box.getUid()).get())
            .data()?[FirestoreCollections.CLASS]) as List<dynamic>)
        .map((id) => id.toString())
        .toList();
    List<ClassModel> classList = [];

    for (String docId in classes) {
      Map<String, dynamic>? tempClass = (await _class.doc(docId).get()).data();
      if (tempClass != null) {
        ClassModel classModel = ClassModel.fromMap(tempClass);
        classModel.docId = docId;
        classList.add(classModel);
      } else
        return [];
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setClassList(classList);
    return classList;
  }
}
