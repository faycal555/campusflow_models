import '../json_utils.dart';

/// Un cours suivi sur le campus.
class Course {
  final String id;
  final String name;
  final String teacher;
  final int credits;

  const Course({
    required this.id,
    required this.name,
    required this.teacher,
    required this.credits,
  });

  /// Construit un cours depuis une Map JSON.
  ///
  /// Lève une [FormatException] si les données sont invalides.
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: readField<String>(json, 'id'),
      name: readField<String>(json, 'name'),
      teacher: readField<String>(json, 'teacher'),
      credits: readField<int>(json, 'credits'),
    );
  }

  /// Retourne un nouveau cours en ne remplaçant que les champs fournis.
  Course copyWith({String? id, String? name, String? teacher, int? credits}) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      teacher: teacher ?? this.teacher,
      credits: credits ?? this.credits,
    );
  }

  @override
  String toString() =>
      'Course(id: $id, name: $name, teacher: $teacher, credits: $credits)';
}
