import 'dart:convert';

import 'period_model.dart';

class ClassModel {
  String subject;
  String grade;
  String section;
  String description;
  String meetingLink;
  String? docId;
  List<PeriodModel> timetable;

  ClassModel({
    required this.subject,
    required this.grade,
    required this.section,
    required this.description,
    required this.meetingLink,
    required this.timetable,
  });

  String get classId => grade.toString() + section + subject;

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'grade': grade,
      'section': section,
      'description': description,
      'meetingLink': meetingLink,
      'classId': classId,
      'timetable': timetable.map((x) => x.toMap()).toList(),
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      subject: map['subject'],
      grade: map['grade'],
      section: map['section'],
      description: map['description'],
      meetingLink: map['meetingLink'],
      timetable: List<PeriodModel>.from(
        map['timetable']?.map(
          (x) => PeriodModel.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassModel(subject: $subject, grade: $grade, section: $section, description: $description, meetingLink: $meetingLink, docId: $docId, timetable: $timetable)';
  }
}
