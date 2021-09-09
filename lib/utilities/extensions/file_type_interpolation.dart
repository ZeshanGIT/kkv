import 'package:file_picker/file_picker.dart';

extension FileTypeFromString on String {
  FileType toFileType() {
    return FileType.values.firstWhere((ft) => ft.toString() == this);
  }
}
