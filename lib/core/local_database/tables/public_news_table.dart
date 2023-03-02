import 'package:drift/drift.dart';

// part 'public_news_table.g.dart';


class PublicNews extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get title => text().customConstraint('UNIQUE').nullable()();
  TextColumn get link => text().nullable()();
  TextColumn get jetpackFeaturedMediaUrl => text().nullable()();
  TextColumn get date => text().nullable()();
  
  @override
  List<Set<Column<Object>>>? get uniqueKeys => [{title}];
}
