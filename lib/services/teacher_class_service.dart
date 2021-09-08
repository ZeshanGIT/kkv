import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kkv/common/constants.dart';
import 'package:kkv/model/class_model.dart';
import 'package:kkv/router/teacher_routes.dart';
import 'package:kkv/utilities/extensions/get_box/basic_extension.dart';

class TeacherClassService {
  static final _class =
      FirebaseFirestore.instance.collection(FirestoreCollections.CLASS);
  static final _teacher =
      FirebaseFirestore.instance.collection(FirestoreCollections.TEACHER);
  static final GetStorage _box = GetStorage();

  static Future<void> createClass(ClassModel classModel) async {
    // int n =
    var temp = await _class
        .where(
          "classId",
          isGreaterThanOrEqualTo: "${classModel.grade}${classModel.section}",
        )
        .where(
          "classId",
          isLessThan: "${int.parse(classModel.grade) + 1}${classModel.section}",
        );
    // .size;
    // print("Size Subject $n");

    // if (n > 0) {
    //   Get.dialog(
    //     AlertDialog(
    //       title: Text("Class already exists"),
    //       content: Text(
    //         "Tap ok to continue\n\n${classModel.grade} Grade\n${classModel.section} Section\n${classModel.subject}",
    //       ),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Get.back();
    //             Get.back();
    //           },
    //           child: Text("Ok"),
    //         ),
    //       ],
    //     ),
    //     barrierDismissible: false,
    //   );
    // } else {
    //   String newClassId = (await _class.add(classModel.toMap())).id;
    //   _teacher.doc(_box.getUid()).update(
    //     {
    //       FirestoreCollections.CLASS: FieldValue.arrayUnion([newClassId]),
    //     },
    //   );
    //   Get.offAllNamed(TeacherRoutes.HOME);
    // }
  }
}
