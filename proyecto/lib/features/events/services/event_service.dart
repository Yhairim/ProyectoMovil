import 'package:flutter/foundation.dart';

@immutable
class EventItem {
  const EventItem({
    required this.id,
    required this.name,
    required this.location,
    required this.date,
    this.description = '',
  });
  final String id, name, location, description;
  final DateTime date;
}

class EventService extends ChangeNotifier {
  EventService._();
  static final EventService instance = EventService._();
  final List<EventItem> _events = [
    EventItem(
      id: '1',
      name: 'Boda de Andrea y Luis',
      location: 'Jardín Las Nubes',
      date: DateTime.now().add(const Duration(days: 5)),
      description: 'Cabina 360 en recepción',
    ),
    EventItem(
      id: '2',
      name: 'Aniversario Grupo Norte',
      location: 'Salón Magnolia',
      date: DateTime.now().add(const Duration(days: 12)),
      description: 'Celebración anual',
    ),
  ];
  List<EventItem> get events => List.unmodifiable(_events);
  void save({
    String? id,
    required String name,
    required String location,
    required DateTime date,
    required String description,
  }) {
    final index = id == null ? -1 : _events.indexWhere((e) => e.id == id);
    final item = EventItem(
      id: id ?? DateTime.now().microsecondsSinceEpoch.toString(),
      name: name,
      location: location,
      date: date,
      description: description,
    );
    if (index < 0) {
      _events.add(item);
    } else {
      _events[index] = item;
    }
    _events.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();
  }

  void remove(String id) {
    _events.removeWhere((e) => e.id == id);
    notifyListeners();
  }
}
