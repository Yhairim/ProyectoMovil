import 'package:flutter/material.dart';

import 'features/auth/screens/login_screen.dart';

void main() => runApp(const YgdApp());

class YgdApp extends StatelessWidget {
  const YgdApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'YGD 360 Photo Booth',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF7652D6),
        primary: const Color(0xFF7652D6),
        secondary: const Color(0xFF3686E8),
        surface: const Color(0xFFF8F7FC),
      ),
      scaffoldBackgroundColor: const Color(0xFFF8F7FC),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    ),
    home: const LoginScreen(),
  );
}
