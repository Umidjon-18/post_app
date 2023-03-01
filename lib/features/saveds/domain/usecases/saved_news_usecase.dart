import 'package:post_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post_app/core/usecase/usecase.dart';
import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';
import 'package:post_app/features/saveds/domain/repositories/saved_news_repository.dart';

import '../../../public_news/data/models/public_news_model.dart';

class SavedNewsUseCase implements UseCase<List<PublicNewsModel>, PublicNewsParams> {
  final SavedNewsRepository savedNewsRepository;

  SavedNewsUseCase({required this.savedNewsRepository});
  @override
  Future<Either<Failure, List<PublicNewsModel>>> call(PublicNewsParams params) async {
    return await savedNewsRepository.getSavedNews();
  }

  Future<Either<Failure, List<PublicNewsModel>>> deleteNews(PublicNewsParams params) async {
    return await savedNewsRepository.deleteNews(params.newsModel!);
  }

  Future<Either<Failure, List<PublicNewsModel>>> deleteSelectedNews(PublicNewsParams params) async {
    return await savedNewsRepository.deleteSelectedNews(params.selectedModels!);
  }

  
}
