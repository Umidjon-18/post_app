import 'package:post_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post_app/core/usecase/usecase.dart';
import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';

class DeletePublicNewsUseCase implements UseCase<List<PublicNewsModel>, PublicNewsParams> {
  final PublicNewsLocalDataSource localDataSource;

  DeletePublicNewsUseCase({required this.localDataSource});
  @override
  Future<Either<Failure, List<PublicNewsModel>>> call(PublicNewsParams params) async {
    return localDataSource.deleteSaved(params);
  }

  Future<Either<Failure, List<PublicNewsModel>>> deleteSelectedNews(
    PublicNewsParams params,
  ) async {
    return localDataSource.deleteSelectedSaveds(params);
  }
}
