import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';

import '../../../../core/local_database/local_database.dart';

abstract class PublicNewsRepository {
  Future<Either<Failure, List<PublicNew>>> getPublicNews({
    required int newsCount,
  });
  Future<void> saveSelectedNews(List<PublicNew> selectedNews);
  Future<void> saveNews(PublicNew newsModel);
}
