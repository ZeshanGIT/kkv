import 'dart:convert';

import 'attachment_model.dart';

class AssignmentModel {
  String docId;
  String title;
  String chapter;
  String description;
  String links;
  List<AttachmentModel> attachments;
  DateTime assignedAt;
  DateTime deadline;
  AssignmentModel({
    required this.docId,
    required this.title,
    required this.chapter,
    required this.description,
    required this.links,
    required this.attachments,
    required this.assignedAt,
    required this.deadline,
  });

  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'title': title,
      'chapter': chapter,
      'description': description,
      'links': links,
      'attachments': attachments.map((x) => x.toMap()).toList(),
      'assignedAt': assignedAt.millisecondsSinceEpoch,
      'deadline': deadline.millisecondsSinceEpoch,
    };
  }

  factory AssignmentModel.fromMap(Map<String, dynamic> map) {
    return AssignmentModel(
      docId: map['docId'],
      title: map['title'],
      chapter: map['chapter'],
      description: map['description'],
      links: map['links'],
      attachments: List<AttachmentModel>.from(
          map['attachments']?.map((x) => AttachmentModel.fromMap(x))),
      assignedAt: DateTime.fromMillisecondsSinceEpoch(map['assignedAt']),
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AssignmentModel.fromJson(String source) =>
      AssignmentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AssignmentModel(docId: $docId, title: $title, chapter: $chapter, description: $description, links: $links, attachments: $attachments, assignedAt: $assignedAt, deadline: $deadline)';
  }
}
