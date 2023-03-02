import 'package:drift/drift.dart';

class WordDefinitions extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get word => text().nullable().unique()();
  TextColumn get definition => text().nullable()();

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [{word}];
}
