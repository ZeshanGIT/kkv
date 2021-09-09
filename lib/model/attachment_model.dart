import 'dart:convert';

import 'package:file_picker/file_picker.dart';

import '../utilities/extensions/file_type_interpolation.dart';

class AttachmentModel {
  final String title;
  final FileType type;
  final String url;
  AttachmentModel({
    required this.title,
    required this.type,
    required this.url,
  });

  @override
  String toString() => 'AttachmentModel(title: $title, type: $type, url: $url)';

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type.toString(),
      'url': url,
    };
  }

  factory AttachmentModel.fromMap(Map<String, dynamic> map) {
    return AttachmentModel(
      title: map['title'],
      type: map['type'].toString().toFileType(),
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AttachmentModel.fromJson(String source) =>
      AttachmentModel.fromMap(json.decode(source));
}
