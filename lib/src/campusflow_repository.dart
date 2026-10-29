import 'dart:convert';

import 'models/course.dart';
import 'models/task.dart';
import 'models/user.dart';

/// Données renvoyées par le "serveur" simulé, telles qu'une API les enverrait.
const String _fakeApiResponse = '''
{
  "user": {
    "id": "u1",
    "name": "Awa Traoré",
    "email": "awa.traore@campus.bf"
  },
  "courses": [
    {"id": "c1", "name": "Développement mobile", "teacher": "M. Ouédraogo", "credits": 4},
    {"id": "c2", "name": "Bases de données", "teacher": "Mme Kaboré", "credits": 3}
  ],
  "tasks": [
    {"id": "t1", "title": "Atelier modèles Dart", "courseId": "c1", "dueDate": "2026-11-05T08:00:00.000", "isDone": false},
    {"id": "t2", "title": "Schéma relationnel", "courseId": "c2", "dueDate": "2026-11-12T18:00:00.000", "isDone": true}
  ]
}
''';

/// Dépôt simulé : imite un appel réseau avec [Future.delayed].
class CampusFlowRepository {
  /// Latence simulée de chaque appel.
  final Duration latency;

  /// JSON brut renvoyé par le faux serveur (remplaçable dans les tests).
  final String rawJson;

  const CampusFlowRepository({
    this.latency = const Duration(milliseconds: 500),
    this.rawJson = _fakeApiResponse,
  });

  Future<Map<String, dynamic>> _fetch() => Future.delayed(
    latency,
    () => jsonDecode(rawJson) as Map<String, dynamic>,
  );

  Future<User> fetchCurrentUser() async {
    final data = await _fetch();
    return User.fromJson(data['user'] as Map<String, dynamic>);
  }

  Future<List<Course>> fetchCourses() async {
    final data = await _fetch();
    return (data['courses'] as List)
        .map((json) => Course.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Task>> fetchTasks() async {
    final data = await _fetch();
    return (data['tasks'] as List)
        .map((json) => Task.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
