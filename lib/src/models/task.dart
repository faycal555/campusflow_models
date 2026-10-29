import '../json_utils.dart';

/// Une tâche (devoir, TP, révision…) rattachée à un cours.
class Task {
  final String id;
  final String title;
  final String courseId;
  final DateTime dueDate;
  final bool isDone;

  const Task({
    required this.id,
    required this.title,
    required this.courseId,
    required this.dueDate,
    this.isDone = false,
  });

  /// Construit une tâche depuis une Map JSON.
  ///
  /// `dueDate` est attendue au format ISO 8601 ; `isDone` est optionnel.
  /// Lève une [FormatException] si les données sont invalides.
  factory Task.fromJson(Map<String, dynamic> json) {
    final rawDate = readField<String>(json, 'dueDate');
    final dueDate = DateTime.tryParse(rawDate);
    if (dueDate == null) {
      throw FormatException('Champ "dueDate" invalide : "$rawDate"', json);
    }
    return Task(
      id: readField<String>(json, 'id'),
      title: readField<String>(json, 'title'),
      courseId: readField<String>(json, 'courseId'),
      dueDate: dueDate,
      isDone: json.containsKey('isDone')
          ? readField<bool>(json, 'isDone')
          : false,
    );
  }

  /// Retourne une nouvelle tâche en ne remplaçant que les champs fournis.
  Task copyWith({
    String? id,
    String? title,
    String? courseId,
    DateTime? dueDate,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      courseId: courseId ?? this.courseId,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() =>
      'Task(id: $id, title: $title, courseId: $courseId, '
      'dueDate: ${dueDate.toIso8601String()}, isDone: $isDone)';
}
