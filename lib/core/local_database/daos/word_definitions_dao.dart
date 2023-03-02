import 'package:drift/drift.dart';
import '../local_database.dart';

import '../tables/word_defenition_table.dart';


part 'word_definitions_dao.g.dart';

@DriftAccessor(tables: [WordDefinitions])
class WordDefinitionsDao extends DatabaseAccessor<LocalDatabase> with _$WordDefinitionsDaoMixin {
  WordDefinitionsDao(LocalDatabase db) : super(db);

  //! Watching word definitions database
  Stream<List<WordDefinition>> watch() {
    return (select(db.wordDefinitions)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.asc),
          ]))
        .watch();
  }

  //! Save word item
  Future saveWord(WordDefinition word) => into(db.wordDefinitions).insert(word);

  //! Delete word item
  Future deleteWord(WordDefinition word) => delete(db.wordDefinitions).delete(word);

  //! Delete multiple word items
  Future deleteSelectedWords(Iterable<WordDefinition> selectedWords) async {
    return await batch((batch) {
      for (var word in selectedWords) {
        batch.deleteWhere(db.wordDefinitions, (tbl) => tbl.word.equals(word.word ?? ""));
      }
    });
  }
}
