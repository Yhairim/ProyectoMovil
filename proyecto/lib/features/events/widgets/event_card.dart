import 'package:flutter/material.dart';

import '../services/event_service.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, this.onTap});
  final EventItem event;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final date = event.date;
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0EBFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${date.day}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF7652D6),
                      ),
                    ),
                    Text(
                      [
                        'ENE',
                        'FEB',
                        'MAR',
                        'ABR',
                        'MAY',
                        'JUN',
                        'JUL',
                        'AGO',
                        'SEP',
                        'OCT',
                        'NOV',
                        'DIC',
                      ][date.month - 1],
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      event.location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.blueGrey.shade600),
                    ),
                    SizedBox(height: 5),
                    Text(
                      event.description.isEmpty
                          ? 'Evento programado'
                          : event.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blueGrey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF7652D6)),
            ],
          ),
        ),
      ),
    );
  }
}
