/// Un utilisateur de CampusFlow (étudiant).
class User {
  final String id;
  final String name;
  final String email;

  const User({required this.id, required this.name, required this.email});

  /// Retourne un nouvel utilisateur en ne remplaçant que les champs fournis.
  User copyWith({String? id, String? name, String? email}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'User(id: $id, name: $name, email: $email)';
}
