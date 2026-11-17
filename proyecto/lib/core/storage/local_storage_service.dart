/// Almacenamiento de sesión temporal para el prototipo local.
/// Se puede reemplazar por SharedPreferences al conectar persistencia real.
class LocalStorageService {
  static final LocalStorageService instance = LocalStorageService._();
  LocalStorageService._();

  String? _email;
  String? _name;
  String? _role;

  String? get email => _email;
  String? get name => _name;
  String? get role => _role;
  bool get isSignedIn => _email != null;

  void signIn({
    required String email,
    required String name,
    required String role,
  }) {
    _email = email;
    _name = name;
    _role = role;
  }

  void signOut() {
    _email = null;
    _name = null;
    _role = null;
  }
}
