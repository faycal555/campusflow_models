import 'package:campusflow_models/campusflow_models.dart';
import 'package:test/test.dart';

void main() {
  test('copyWith ne modifie que les champs fournis', () {
    final task = Task(
      id: 't1',
      title: 'Atelier modèles Dart',
      courseId: 'c1',
      dueDate: DateTime(2026, 11, 5, 8),
    );

    final done = task.copyWith(isDone: true);

    expect(done.isDone, isTrue);
    expect(done.id, task.id);
    expect(done.title, task.title);
    expect(done.courseId, task.courseId);
    expect(done.dueDate, task.dueDate);
    // L'original reste inchangé (immutabilité).
    expect(task.isDone, isFalse);
  });

  test('fromJson construit les modèles chargés par le dépôt simulé', () async {
    const repository = CampusFlowRepository(
      latency: Duration(milliseconds: 10),
    );

    final user = await repository.fetchCurrentUser();
    final courses = await repository.fetchCourses();
    final tasks = await repository.fetchTasks();

    expect(user.email, 'awa.traore@campus.bf');
    expect(courses, hasLength(2));
    expect(courses.first.credits, 4);
    expect(tasks, hasLength(2));
    expect(tasks.first.title, 'Atelier modèles Dart');
    expect(tasks.first.dueDate, DateTime(2026, 11, 5, 8));
    expect(tasks.last.isDone, isTrue);
  });

  test('fromJson lève une FormatException sur un JSON invalide', () {
    // Champ "credits" manquant.
    expect(
      () => Course.fromJson({'id': 'c1', 'name': 'Maths', 'teacher': 'X'}),
      throwsA(isA<FormatException>()),
    );
    // Champ "email" du mauvais type.
    expect(
      () => User.fromJson({'id': 'u1', 'name': 'Awa', 'email': 42}),
      throwsFormatException,
    );
  });
}
