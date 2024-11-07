import 'package:e_learning/models/course_category.dart';
import 'package:e_learning/models/section.dart';

class Course {
  final String _id;

  final String _title;

  final String _thumbnailUrl;

  final String _description;

  final String _createdBy;

  final String _createdDate;

  final double _rate;

  bool _isFavorite;

  final double _price;

  final CourseCategory _courseCategory;

  final String _duration;

  final int _lessonNo;

  final List<Section> _sections;

  Course(
      this._id,
      this._title,
      this._thumbnailUrl,
      this._description,
      this._createdBy,
      this._createdDate,
      this._rate,
      this._isFavorite,
      this._courseCategory,
      this._price,
      this._duration,
      this._lessonNo,
      this._sections);

  bool get isFavorite => _isFavorite;

  set isFavorite(bool value) {
    _isFavorite = value;
  }

  double get rate => _rate;

  String get createdDate => _createdDate;

  String get createdBy => _createdBy;

  String get description => _description;

  String get thumbnailUrl => _thumbnailUrl;

  String get title => _title;

  String get id => _id;

  CourseCategory get courseCategory => _courseCategory;

  double get price => _price;

  String get duration => _duration;

  int get lessonNo => _lessonNo;

  List<Section> get sections => _sections;

  // Method to convert a Course object to a Map for Firebase Firestore
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      '_title': title,
      '_thumbnailUrl': thumbnailUrl,
      '_description': description,
      '_createdBy': createdBy,
      '_createdDate': createdDate,
      '_rate': rate,
      '_isFavorite': isFavorite,
      '_price': price,
      '_courseCategory': courseCategory.name, // Store category as string
      '_duration': duration,
      '_lessonNo': lessonNo,
      '_sections': sections.map((section) => section.toMap()).toList(), // Convert sections to map
    };
  }


  // Factory to convert Map to Course object
  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      map['_id'] as String,
      map['_title'] as String,
      map['_thumbnailUrl'] as String,
      map['_description'] as String,
      map['_createdBy'] as String,
      map['_createdDate'] as String,
      map['_rate'] as double,
      map['_isFavorite'] as bool,
      CourseCategory.values.firstWhere(
            (e) => e.name == map['_courseCategory'],
        orElse: () => CourseCategory.other, // Default value if no match
      ),      map['_price'] as double,
      map['_duration'] as String,
      map['_lessonNo'] as int,
      (map['_sections'] as List).map((item) => Section.fromMap(item)).toList(),
    );
  }



}
