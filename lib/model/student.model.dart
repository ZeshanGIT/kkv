import 'dart:convert';

import 'user.model.dart';

class StudentModel {
  final String id;
  final String name;
  final String email;
  final String profilePic;
  final int grade;
  final String section;
  final String roleNumber;

  StudentModel({
    required this.section,
    required this.grade,
    required this.roleNumber,
    required this.id,
    required this.name,
    required this.email,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'grade': grade,
      'section': section,
      'roleNumber': roleNumber,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      profilePic: map['profilePic'],
      grade: map['grade'],
      section: map['section'],
      roleNumber: map['roleNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  factory StudentModel.fromUser({
    required UserModel userModel,
    required int grade,
    required String section,
    required String roleNumber,
  }) {
    return StudentModel(
      section: section,
      grade: grade,
      roleNumber: roleNumber,
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      profilePic: userModel.profilePic,
    );
  }
}
