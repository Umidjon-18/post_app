import '../../../../core/local_database/local_database.dart';

class PublicNewsParams {
  PublicNew? newsModel;
  List<PublicNew>? selectedNews;
  PublicNewsParams({
    this.newsModel,
    this.selectedNews,
  });
}
