import 'package:flutter/material.dart';

import '../services/event_service.dart';

class ManageEventScreen extends StatefulWidget {
  const ManageEventScreen({super.key, this.event});
  final EventItem? event;
  @override
  State<ManageEventScreen> createState() => _ManageEventScreenState();
}

class _ManageEventScreenState extends State<ManageEventScreen> {
  final _key = GlobalKey<FormState>();
  late final TextEditingController _name, _location, _description;
  late DateTime _date;
  @override
  void initState() {
    super.initState();
    final e = widget.event;
    _name = TextEditingController(text: e?.name);
    _location = TextEditingController(text: e?.location);
    _description = TextEditingController(text: e?.description);
    _date = e?.date ?? DateTime.now().add(const Duration(days: 1));
  }

  @override
  void dispose() {
    _name.dispose();
    _location.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date.isBefore(DateTime.now()) ? DateTime.now() : _date,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
    );
    if (picked != null) setState(() => _date = picked);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.event == null ? 'Nuevo evento' : 'Editar evento'),
    ),
    body: Form(
      key: _key,
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const Text(
            'Detalles del evento',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          const Text('Organiza una sesión de cabina 360.'),
          SizedBox(height: 24),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
              labelText: 'Nombre del evento',
              prefixIcon: Icon(Icons.celebration_outlined),
            ),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'Agrega un nombre' : null,
          ),
          SizedBox(height: 14),
          TextFormField(
            controller: _location,
            decoration: const InputDecoration(
              labelText: 'Lugar',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'Agrega un lugar' : null,
          ),
          SizedBox(height: 14),
          TextFormField(
            controller: _description,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Descripción',
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: _pickDate,
            icon: const Icon(Icons.calendar_month),
            label: Text('Fecha: ${_date.day}/${_date.month}/${_date.year}'),
          ),
          SizedBox(height: 26),
          FilledButton(
            onPressed: () {
              if (!_key.currentState!.validate()) return;
              EventService.instance.save(
                id: widget.event?.id,
                name: _name.text.trim(),
                location: _location.text.trim(),
                date: _date,
                description: _description.text.trim(),
              );
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(14),
              child: Text('Guardar evento'),
            ),
          ),
        ],
      ),
    ),
  );
}
