import 'package:moor/moor.dart';

class Events extends Table {
  TextColumn get type => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get realTime => boolean()();
  TextColumn get additional => text()();
}
