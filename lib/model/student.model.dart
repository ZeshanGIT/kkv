import 'package:kkv/model/user.model.dart';

class StudentModel {
  final UserModel user;
  final int grade;
  final String section;
  final String roleNumber;

  StudentModel({
    required this.user,
    required this.section,
    required this.grade,
    required this.roleNumber,
  });
}
