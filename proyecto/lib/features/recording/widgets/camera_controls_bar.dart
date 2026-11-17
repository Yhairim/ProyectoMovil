import 'package:flutter/material.dart';

class CameraControlsBar extends StatelessWidget {
  const CameraControlsBar({
    super.key,
    required this.isRecording,
    required this.onToggle,
  });
  final bool isRecording;
  final VoidCallback onToggle;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton.filledTonal(
        onPressed: () {},
        icon: const Icon(Icons.flip_camera_android),
        tooltip: 'Cambiar cámara',
      ),
      SizedBox(width: 22),
      GestureDetector(
        onTap: onToggle,
        child: Container(
          width: 76,
          height: 76,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isRecording ? Colors.red : const Color(0xFF7652D6),
              shape: isRecording ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: isRecording ? BorderRadius.circular(9) : null,
            ),
          ),
        ),
      ),
      SizedBox(width: 22),
      IconButton.filledTonal(
        onPressed: () {},
        icon: const Icon(Icons.flash_off_outlined),
        tooltip: 'Flash',
      ),
    ],
  );
}
