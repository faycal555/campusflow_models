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
