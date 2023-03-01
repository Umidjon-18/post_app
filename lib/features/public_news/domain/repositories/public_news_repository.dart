import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';

abstract class PublicNewsRepository {
  Future<Either<Failure, List<PublicNewsModel>>> getPublicNews({
    required int newsCount,
  });
  Future<void> saveSelectedNews(List<PublicNewsModel> selectedNews);
  Future<void> saveNews(PublicNewsModel newsModel);

}
