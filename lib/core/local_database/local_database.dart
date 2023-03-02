import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:post_app/core/local_database/daos/public_news_dao.dart';
import 'package:post_app/core/local_database/tables/public_news_table.dart';
import 'package:path/path.dart' as p;



part 'local_database.g.dart';


@DriftDatabase(tables: [PublicNews], daos: [PublicNewsDao])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));
    return NativeDatabase.createBackgroundConnection(file);
  });
}
