import 'package:post_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post_app/core/usecase/usecase.dart';
import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';

import '../../../public_news/data/models/public_news_model.dart';

class SavedFactsUseCase implements UseCase<List<PublicNewsModel>, PublicNewsParams> {
  @override
  Future<Either<Failure, List<PublicNewsModel>>> call(PublicNewsParams params) {
    throw UnimplementedError();
  }
  
}