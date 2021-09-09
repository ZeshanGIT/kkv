import '../../model/class_model.dart';
import 'on_string.dart';

extension SortListClassModel on List<ClassModel> {
  void sortBySubject() {
    this.sort((a, b) => a.subject.compareTo(b.subject));
  }

  void sortByGrade() {
    this.sort(
      (a, b) => a.grade.romanToDeweyDecimal - b.grade.romanToDeweyDecimal,
    );
  }
}
