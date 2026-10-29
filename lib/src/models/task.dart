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
