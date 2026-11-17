import 'package:flutter/material.dart';

import '../../../core/storage/local_storage_service.dart';
import '../../auth/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final session = LocalStorageService.instance;
    return ListView(
      padding: const EdgeInsets.all(22),
      children: [
        const Text(
          'Mi perfil',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF7652D6), Color(0xFF3686E8)],
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, color: Colors.white, size: 38),
              ),
              SizedBox(height: 12),
              Text(
                session.name ?? 'Usuario YGD',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                session.email ?? 'Cuenta personal',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        _ProfileTile(
          icon: Icons.badge_outlined,
          title: 'Tipo de cuenta',
          value: session.role ?? 'Usuario',
        ),
        const _ProfileTile(
          icon: Icons.videocam_outlined,
          title: 'Equipo',
          value: 'Cabina 360',
        ),
        const _ProfileTile(
          icon: Icons.help_outline,
          title: 'Acerca de',
          value: 'YGD 360 Photo Booth',
        ),
        SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {
            session.signOut();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => LoginScreen()),
              (_) => false,
            );
          },
          icon: const Icon(Icons.logout),
          label: const Text('Cerrar sesión'),
        ),
      ],
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title, value;
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 5),
    leading: CircleAvatar(
      backgroundColor: const Color(0xFFF0EBFF),
      child: Icon(icon, color: const Color(0xFF7652D6)),
    ),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
    subtitle: Text(value),
  );
}
