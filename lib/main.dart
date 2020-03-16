import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'db.dart';
import 'event_list.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void _recordNewEvent() {
    print('new event requested');
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: recorderTheme,
      home: MultiProvider(
      providers: [
        Provider<EventDatabase>(
          create: (_) => EventDatabase(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recorder'),
        ),
        body: Center(
          child: EventList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _recordNewEvent,
          tooltip: 'New',
          child: Icon(Icons.add),
        ),
      ),
    ));
  }
}
