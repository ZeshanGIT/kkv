import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
final BORDER_RADIUS_MEDIUM = BorderRadius.circular(8);
// ignore: non_constant_identifier_names
final BORDER_RADIUS_LARGE = BorderRadius.circular(30);

const TITLE = "Student Management";

const SIZED_BOX_MAX_WIDTH = const SizedBox(width: double.maxFinite);
const SIZED_BOX_8 = const SizedBox(
  width: 8,
  height: 8,
);

const SIZED_BOX_16 = const SizedBox(
  width: 16,
  height: 16,
);

const SIZED_BOX_24 = const SizedBox(
  height: 24,
  width: 24,
);

const SIZED_BOX_32 = const SizedBox(
  height: 32,
  width: 32,
);

const SIZED_BOX_64 = const SizedBox(
  height: 64,
  width: 64,
);
const SIZED_BOX_128 = const SizedBox(
  height: 128,
  width: 128,
);

const SUBJECT_TITLE_STYLE = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const SUBJECT_SUB_HEADING_STYLE = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const SUBJECT_DESC_STYLE = const TextStyle(
  fontSize: 12,
);

class StoredDetails {
  static const USER_ID = "uid";
  static const USER = "user";
  static const ROLE = "role";
  static const CLASS_LIST = "class-list";
}

class UserRole {
  static const STUDENT = "student";
  static const TEACHER = "teacher";
}

class FirestoreCollections {
  static const STUDENT = "student";
  static const TEACHER = "teacher";
  static const CLASS = "class";

  static const String ASSIGNMENT = "assignment";
}
