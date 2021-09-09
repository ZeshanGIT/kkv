import 'package:cloud_firestore/cloud_firestore.dart';

import '../common/constants.dart';
import '../model/assignment_model.dart';

class AssignmentService {
  final _assignment =
      FirebaseFirestore.instance.collection(FirestoreCollections.ASSIGNMENT);

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
              .startAtDocument(lastAssignment!)
              .limit(pageSize)
              .get())
          .docs;
    List<AssignmentModel> assignmentList = newDocs
        .map((ds) => AssignmentModel.fromMap(ds.data() as Map<String, dynamic>))
        .toList();
    print("Assignment List");
    print(assignmentList);
    return assignmentList;
  }
}
