import 'package:event_recorder/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moor/moor.dart' as moor;

import 'db.dart';
import 'event_list.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var e = Event(
    //   id: null,
    //   type: 'foo',
    //   name: 'bar',
    //   description: '',
    //   timestamp: DateTime.now(),
    //   realTime: false,
    //   additional: '',
    // );
    return MultiProvider(
        providers: [
          Provider<EventDatabase>(
            create: (_) => EventDatabase(),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: recorderTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('Recorder'),
                    ),
                    body: Center(
                      child: EventList(),
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () => Navigator.pushNamed(context, 'add'),
                      tooltip: 'New',
                      child: Icon(Icons.add),
                    ),
                  ),
              'add': (context) => Scaffold(
                  appBar: AppBar(
                    title: Text('Add Event'),
                  ),
                  body: AddScreen()),
            }));
  }
}
