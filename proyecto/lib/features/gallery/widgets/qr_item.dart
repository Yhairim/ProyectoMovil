import 'package:flutter/material.dart';

class QrItem extends StatelessWidget {
  const QrItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
  });
  final String title, subtitle;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: color),
        ),
        SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(color: Colors.blueGrey.shade500, fontSize: 12),
              ),
            ],
          ),
        ),
        const Icon(Icons.qr_code_2, size: 30, color: Color(0xFF7652D6)),
      ],
    ),
  );
}
