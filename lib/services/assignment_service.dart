import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kkv/model/attachment_model.dart';

import '../common/constants.dart';
import '../model/assignment_model.dart';

class AssignmentService {
  final _assignment =
      FirebaseFirestore.instance.collection(FirestoreCollections.ASSIGNMENT);
  final fbStorage = FirebaseStorage.instance.ref('attachment');

  DocumentSnapshot? lastAssignment;
  final assignedAt = "assignedAt";

  Future<List<AssignmentModel>> fetchMore(int pageSize) async {
    List<DocumentSnapshot> newDocs;
    print("Fetching - Assignment Service");
    if (lastAssignment == null)
      newDocs = (await _assignment
              .orderBy(assignedAt, descending: true)
              .limit(pageSize)
              .get())
          .docs;
    else
      newDocs = (await _assignment
              .orderBy(assignedAt, descending: true)
              .startAfterDocument(lastAssignment!)
              .limit(pageSize)
              .get())
          .docs;

    if (lastAssignment == null && newDocs.isEmpty) return [];

    List<AssignmentModel> assignmentList = newDocs
        .map(
          (ds) => AssignmentModel.fromMap(
            {
              ...(ds.data() as Map<String, dynamic>),
              "docId": ds.reference.id,
            },
          ),
        )
        .toList();

    print("Assignment List");
    lastAssignment = newDocs.last;
    print(lastAssignment);
    print(assignmentList);
    return assignmentList;
  }

  Future<void> addAssignment(
    String title,
    String desc,
    List<AttachmentModel> attachments,
    DateTime dueDate,
  ) async {
    // print("Title $title");
    // print("Desc $desc");
    // print("Duedate $dueDate");
    // attachments.forEach(print);

    List<AttachmentModel> uploadedAttachments = [];
    for (AttachmentModel at in attachments) {
      if (at.type == AttachmentModel.LINK)
        uploadedAttachments.add(at);
      else {
        print(at.file!.path);
        File file = await File(at.file!.path).create();
        uploadedAttachments.add(
          at.copyWith(
            url: await uploadAttachment(
              file: file,
              name: at.file!.name,
            ),
          ),
        );
      }
    }

    AssignmentModel assignmentModel = AssignmentModel(
      title: title,
      description: desc,
      attachments: uploadedAttachments,
      assignedAt: DateTime.now(),
      deadline: dueDate,
    );
    await _assignment.add(assignmentModel.toMap());
  }

  Future<String?> uploadAttachment({
    required File file,
    required String name,
  }) async {
    try {
      Reference fileRef = fbStorage.child(name);
      TaskSnapshot taskSnapshot =
          await fileRef.putFile(file).whenComplete(() {});
      return await taskSnapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print("Upload failed !!");
      print(e);
      return null;
    }
  }
}
