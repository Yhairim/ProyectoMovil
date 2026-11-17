import 'package:flutter/material.dart';

import '../../../core/storage/local_storage_service.dart';
import '../../events/screens/eventes_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String _role = 'Usuario';
  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Crear cuenta')),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Únete a YGD 360',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                const Text('Crea tu perfil para trabajar con tus eventos.'),
                SizedBox(height: 24),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    labelText: 'Nombre completo',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (v) => v == null || v.trim().isEmpty
                      ? 'Escribe tu nombre'
                      : null,
                ),
                SizedBox(height: 14),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                  validator: (v) => v == null || !v.contains('@')
                      ? 'Ingresa un correo válido'
                      : null,
                ),
                SizedBox(height: 14),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  validator: (v) => v == null || v.length < 4
                      ? 'Usa al menos 4 caracteres'
                      : null,
                ),
                SizedBox(height: 14),
                DropdownButtonFormField<String>(
                  value: _role,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de usuario',
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Usuario', child: Text('Usuario')),
                    DropdownMenuItem(
                      value: 'Asistente de evento',
                      child: Text('Asistente de evento'),
                    ),
                  ],
                  onChanged: (v) => setState(() => _role = v ?? 'Usuario'),
                ),
                SizedBox(height: 24),
                FilledButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    LocalStorageService.instance.signIn(
                      email: _email.text.trim(),
                      name: _name.text.trim(),
                      role: _role,
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => EventesScreen()),
                      (_) => false,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(14),
                    child: Text('Crear cuenta'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
