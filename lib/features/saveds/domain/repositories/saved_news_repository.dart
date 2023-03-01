import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../public_news/data/models/public_news_model.dart';

abstract class SavedNewsRepository {
  Future<Either<Failure, List<PublicNewsModel>>> getSavedNews();

  Future<Either<Failure, List<PublicNewsModel>>> deleteNews(
    PublicNewsModel newsModel,
  );

  Future<Either<Failure, List<PublicNewsModel>>> deleteSelectedNews(
    List<PublicNewsModel> selectedNews,
  );
}
