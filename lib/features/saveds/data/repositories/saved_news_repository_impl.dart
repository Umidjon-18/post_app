import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post_app/features/saveds/data/datasource/local/saved_news_datasource.dart';
import 'package:post_app/features/saveds/domain/repositories/saved_news_repository.dart';

class SavedNewsRepositoryImpl implements SavedNewsRepository {
  final SavedNewsLocalDataSource localDataSource;

  SavedNewsRepositoryImpl({required this.localDataSource});
  
  @override
  Future<Either<Failure, List<PublicNewsModel>>> getSavedNews() async {
    return await localDataSource.getSaveds();
  }

  @override
  Future<Either<Failure, List<PublicNewsModel>>> deleteNews(PublicNewsModel newsModel) async {
    return await localDataSource.deleteSaved(PublicNewsParams(newsModel: newsModel));
  }

  @override
  Future<Either<Failure, List<PublicNewsModel>>> deleteSelectedNews(List<PublicNewsModel> selectedNews) async {
    return await localDataSource.deleteSelectedSaveds(PublicNewsParams(selectedModels: selectedNews));
  }
}
