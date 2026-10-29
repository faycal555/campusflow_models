/// Lit le champ [key] dans [json] et vérifie qu'il est du type [T].
///
/// Lève une [FormatException] si le champ est absent ou d'un mauvais type,
/// pour que les erreurs de données soient explicites.
T readField<T>(Map<String, dynamic> json, String key) {
  if (!json.containsKey(key)) {
    throw FormatException('Champ manquant : "$key"', json);
  }
  final value = json[key];
  if (value is! T) {
    throw FormatException(
      'Champ "$key" invalide : attendu $T, reçu ${value.runtimeType}',
      json,
    );
  }
  return value;
}
