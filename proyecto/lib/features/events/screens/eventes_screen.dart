import 'package:flutter/material.dart';

import '../../gallery/screens/gallery_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../recording/screens/recording_screen.dart';
import '../services/event_service.dart';
import '../widgets/event_card.dart';
import 'manage_event_screen.dart';

class EventesScreen extends StatefulWidget {
  const EventesScreen({super.key});
  @override
  State<EventesScreen> createState() => _EventesScreenState();
}

class _EventesScreenState extends State<EventesScreen> {
  int _tab = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [_events(), const GalleryScreen(), const ProfileScreen()];
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _tab, children: pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (v) => setState(() => _tab = v),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label: 'Eventos',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_library_outlined),
            selectedIcon: Icon(Icons.photo_library),
            label: 'Galería',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      floatingActionButton: _tab == 0
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ManageEventScreen()),
              ),
              icon: const Icon(Icons.add),
              label: const Text('Nuevo evento'),
            )
          : null,
    );
  }

  Widget _events() => AnimatedBuilder(
    animation: EventService.instance,
    builder: (context, _) {
      final events = EventService.instance.events;
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'YGD 360',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          const Text(
                            'Tus eventos',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() => _tab = 2),
                      icon: const CircleAvatar(
                        child: Icon(Icons.person_outline),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _welcomeCard(context),
                SizedBox(height: 25),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Próximos eventos',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '${events.length} eventos',
                      style: TextStyle(color: Colors.blueGrey.shade500),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                if (events.isEmpty)
                  _empty(context)
                else
                  ...events.map(
                    (event) => EventCard(
                      event: event,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ManageEventScreen(event: event),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 14),
                OutlinedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RecordingScreen()),
                  ),
                  icon: const Icon(Icons.videocam_outlined),
                  label: const Text('Abrir cabina 360'),
                ),
              ]),
            ),
          ),
        ],
      );
    },
  );
  Widget _welcomeCard(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF7652D6), Color(0xFF3686E8)],
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Momentos que se quedan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 7),
        const Text(
          'Organiza tu cabina, graba y comparte recuerdos.',
          style: TextStyle(color: Colors.white70),
        ),
        SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: FilledButton.tonalIcon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => RecordingScreen()),
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Empezar'),
          ),
        ),
      ],
    ),
  );
  Widget _empty(BuildContext context) => Container(
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Column(
      children: [
        Icon(Icons.event_busy_outlined, size: 38, color: Color(0xFF7652D6)),
        SizedBox(height: 8),
        Text(
          'Aún no hay eventos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Crea un evento para empezar a organizar tus sesiones.'),
      ],
    ),
  );
}
