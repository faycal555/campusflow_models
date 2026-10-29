# campusflow_models

Atelier « Les modèles de CampusFlow en Dart pur » (90 min, binômes).

Package Dart pur (sans Flutter) qui contient les modèles de données de
l'application CampusFlow.

## Étapes de l'atelier

| # | Étape | Livrable | Où le trouver |
|---|-------|----------|---------------|
| 1 | Projet Dart : `dart create campusflow_models`, dépôt Git initialisé | Package créé | `pubspec.yaml`, historique Git |
| 2 | Trois modèles `Task`, `Course`, `User` : attributs `final`, constructeur, `copyWith` | 3 classes | [`lib/src/models/`](lib/src/models/) |
| 3 | `fromJson` pour chaque modèle, chargement simulé avec `Future.delayed` | `fromJson` + dépôt simulé | [`lib/src/models/`](lib/src/models/), [`lib/src/campusflow_repository.dart`](lib/src/campusflow_repository.dart) |
| 4 | Trois tests avec `dart test` : `copyWith`, `fromJson`, erreur attendue | 3 tests qui passent | [`test/campusflow_models_test.dart`](test/campusflow_models_test.dart) |

Chaque étape correspond à un commit dans l'historique Git (`git log`).

## Structure

```
lib/
  campusflow_models.dart          # point d'entrée (exports)
  src/
    json_utils.dart               # lecture typée des champs JSON
    campusflow_repository.dart    # dépôt simulé (Future.delayed)
    models/
      task.dart
      course.dart
      user.dart
example/
  campusflow_models_example.dart  # démonstration
test/
  campusflow_models_test.dart     # les 3 tests
```

## Choix de conception

- **Immutabilité** : tous les attributs sont `final` ; on modifie un objet
  en créant une copie avec `copyWith`.
- **fromJson robuste** : un champ manquant ou d'un mauvais type lève une
  `FormatException` avec un message clair (c'est l'« erreur attendue » testée).
- **Dépôt simulé** : `CampusFlowRepository` décode un JSON local après un
  délai (`Future.delayed`), comme le ferait un appel réseau.

## Lancer le projet

```bash
dart pub get
dart run example/campusflow_models_example.dart
dart test
```

Résultat attendu de `dart test` :

```
00:00 +3: All tests passed!
```
