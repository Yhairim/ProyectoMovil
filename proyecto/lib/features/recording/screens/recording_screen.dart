import 'package:flutter/material.dart';

import '../services/camera_service.dart';
import '../widgets/camera_controls_bar.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});
  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  final _camera = CameraService();
  @override
  void dispose() {
    _camera.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _camera,
    builder: (context, _) => Scaffold(
      backgroundColor: const Color(0xFF171421),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Cabina 360'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(18, 8, 18, 18),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF382B57), Color(0xFF182C45)],
                  ),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.videocam_outlined,
                            size: 64,
                            color: Colors.white70,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Vista previa de cámara',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: .9),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Conecta tu dispositivo para comenzar',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: .65),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 18,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: _camera.isRecording
                              ? Colors.red
                              : Colors.black26,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          _camera.isRecording ? '● GRABANDO' : '● LISTA',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              _camera.isRecording
                  ? 'Grabación en curso'
                  : 'Todo listo para capturar',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            CameraControlsBar(
              isRecording: _camera.isRecording,
              onToggle: _camera.toggleRecording,
            ),
            SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: Text(
                'La vista previa y el guardado de videos estarán disponibles al integrar la cámara.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
