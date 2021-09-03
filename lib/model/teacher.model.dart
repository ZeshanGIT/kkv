import 'dart:convert';

import 'user.model.dart';

class TeacherModel {
  final String id;
  final String name;
  final String email;
  final String profilePic;
  final String empId;
  TeacherModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePic,
    required this.empId,
  });

  factory TeacherModel.fromUser(UserModel userModel, String empId) {
    return TeacherModel(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      profilePic: userModel.profilePic,
      empId: empId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'empId': empId,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      profilePic: map['profilePic'],
      empId: map['empId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source));
}
