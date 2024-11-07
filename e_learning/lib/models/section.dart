import 'package:e_learning/models/lecture.dart';

class Section {
  final String _name;

  final List<Lecture> _lectures;

  Section(this._name, this._lectures);

  List<Lecture> get lectures => _lectures;

  String get name => _name;

  Map<String, dynamic> toMap() {
    return {
      '_name': this._name,
      '_lectures': this._lectures.map((lecture) => lecture.toMap()).toList(), // Convert each Lecture to map
    };
  }

  // Convert from map to Section object
  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      map['_name'] as String,
      (map['_lectures'] as List).map((item) => Lecture.fromMap(item)).toList(),
    );
  }
}
