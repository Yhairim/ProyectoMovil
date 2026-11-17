import 'package:flutter/material.dart';

import '../../events/services/event_service.dart';
import '../widgets/qr_item.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: EventService.instance,
    builder: (context, _) => ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
      children: [
        const Text(
          'Tus recuerdos',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 8),
        Text(
          'Videos y accesos de tus eventos',
          style: TextStyle(color: Colors.blueGrey.shade600),
        ),
        SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF5FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.info_outline, color: Color(0xFF3686E8)),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Los videos se guardarán aquí cuando conectes la cámara y el almacenamiento del dispositivo.',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 22),
        const Text(
          'Eventos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        if (EventService.instance.events.isEmpty)
          const Text('Crea un evento para comenzar tu galería.')
        else
          ...EventService.instance.events.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: QrItem(
                title: e.name,
                subtitle:
                    '${e.location} · ${e.date.day}/${e.date.month}/${e.date.year}',
                color: const Color(0xFF7652D6),
                icon: Icons.movie_outlined,
              ),
            ),
          ),
        SizedBox(height: 12),
        const Text(
          'Acceso para invitados',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        const QrItem(
          title: 'Código QR del evento',
          subtitle: 'El acceso se habilita al publicar la galería',
          color: Color(0xFF3686E8),
          icon: Icons.qr_code_2,
        ),
      ],
    ),
  );
}
