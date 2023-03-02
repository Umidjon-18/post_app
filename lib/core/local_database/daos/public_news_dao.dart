import 'package:drift/drift.dart';
import '../local_database.dart';
import '../tables/public_news_table.dart';

part 'public_news_dao.g.dart';

@DriftAccessor(tables: [PublicNews])
class PublicNewsDao extends DatabaseAccessor<LocalDatabase> with _$PublicNewsDaoMixin {
  PublicNewsDao(LocalDatabase db) : super(db);

  //! Watching database changes with Stream sink
  Stream<List<PublicNew>> watchAllNews() {
    return (select(db.publicNews)
          ..orderBy([
            (tbl) => OrderingTerm(expression: db.publicNews.id, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  //! Insert one news item
  Future insertNews(PublicNew news) async {
      return into(db.publicNews).insert(news);
  }

  //! Delete one news Item
  Future deleteNews(Insertable<PublicNew> news) => delete(db.publicNews).delete(news);

  //! Insert multiple news items
  Future<void> insertMultipleNews(Iterable<Insertable<PublicNew>> newsList) async {
    await batch((batch) {
      batch.insertAll(publicNews, newsList);
    });
  }

  //! Delete multiple news items
  Future<void> deleteMultipleNews(List<PublicNew> newsList) async {
    await batch((batch) {
      for (final item in newsList) {
        batch.deleteWhere(publicNews, (t) => t.link.equals(item.link ?? ""));
      }
    });
  }
}
