import 'package:post_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post_app/core/network/network_info.dart';
import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';
import 'package:post_app/features/public_news/data/datasources/remote/remotesource.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';
import 'package:post_app/features/public_news/domain/repositories/public_news_repository.dart';

class PublicNewsRepositoryImpl implements PublicNewsRepository {
  final PublicNewsRemoteDataSource remoteDataSource;
  final PublicNewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PublicNewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PublicNewsModel>>> getPublicNews({required int newsCount}) async {
    if (await networkInfo.hasConnection) {
      return await remoteDataSource.fetchNews(newsCount: newsCount);
    } else {
      return const Left(ServerFailure("Not connected to Internet"));
    }
  }

  @override
  Future<void> saveNews(PublicNewsModel newsModel) async {
    localDataSource.save(PublicNewsParams(newsModel: newsModel));
  }

  @override
  Future<void> saveSelectedNews(List<PublicNewsModel> selectedNews) async {
    localDataSource.saveSelecteds(
      PublicNewsParams(selectedModels: selectedNews),
    );
  }
}
