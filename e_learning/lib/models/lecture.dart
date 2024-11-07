class Lecture {
  final String _name;

  final String _duration;
  final String videoUrl;

  Lecture(this._name, this._duration, this.videoUrl);

  String get duration => _duration;

  String get name => _name;
  //String get videoUrl => videoUrl;


  // Convert Lecture to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      '_name': _name,
      '_duration': _duration,
      'videoUrl': videoUrl,

    };
  }

  // Convert from map to Lecture object
  factory Lecture.fromMap(Map<String, dynamic> map) {
    return Lecture(
      map['_name'] as String,
      map['_duration'] as String,
      map['videoUrl'] as String,

    );
  }
}
