import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'db.dart';
import 'event_card.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _dbProvider = Provider.of<EventDatabase>(context);

    return StreamBuilder<List<Event>>(
        stream: _dbProvider.watchAllEvents,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }

          final events = snapshot.data;

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) => EventCard(event: events[index]),
          );
        });
  }
}
