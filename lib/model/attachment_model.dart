import 'dart:convert';

import 'package:file_picker/file_picker.dart';

class AttachmentModel {
  final String title;
  final String type;
  final PlatformFile? file;
  final String? url;
  AttachmentModel({
    required this.title,
    required this.type,
    this.url,
    this.file,
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
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AttachmentModel.fromJson(String source) =>
      AttachmentModel.fromMap(json.decode(source));

  static const LINK = "Link";
  static const IMAGE = "Image";
  static const VIDEO = "Video";
  static const DOCUMENT = "Document";

  AttachmentModel copyWith({
    String? title,
    String? type,
    PlatformFile? file,
    String? url,
  }) {
    return AttachmentModel(
      title: title ?? this.title,
      type: type ?? this.type,
      file: file ?? this.file,
      url: url ?? this.url,
    );
  }
}
