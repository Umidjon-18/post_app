import 'package:drift/drift.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post_app/core/local_database/daos/public_news_dao.dart';
import 'package:post_app/core/local_database/local_database.dart';
import 'package:post_app/core/network/network_info.dart';
import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';
import 'package:post_app/features/public_news/data/datasources/remote/remotesource.dart';
import 'package:post_app/features/public_news/domain/repositories/public_news_repository.dart';

class PublicNewsRepositoryImpl implements PublicNewsRepository {
  final PublicNewsRemoteDataSource remoteDataSource;
  final PublicNewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final PublicNewsDao publicNewsDao;

  PublicNewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.publicNewsDao,
  });

  @override
  Future<Either<Failure, List<PublicNew>>> getPublicNews({required int newsCount}) async {
    if (await networkInfo.hasConnection) {
      return await remoteDataSource.fetchNews(newsCount: newsCount);
    } else {
      return const Left(ServerFailure("Not connected to Internet"));
    }
  }

  @override
  Future<void> saveNews(PublicNew newsModel) async {
    publicNewsDao.insertNews(PublicNew(
      title: newsModel.title,
      link: newsModel.link,
      jetpackFeaturedMediaUrl: newsModel.jetpackFeaturedMediaUrl,
      date: newsModel.date,
    ));
  }

  @override
  Future<void> saveSelectedNews(List<PublicNew> selectedNews) async {
    Iterable<Insertable<PublicNew>> insertableList = selectedNews.map(
      (newsModel) => PublicNew(
        title: newsModel.title,
        link: newsModel.link,
        jetpackFeaturedMediaUrl: newsModel.jetpackFeaturedMediaUrl,
        date: newsModel.date,
      ),
    );
    publicNewsDao.insertMultipleNews(insertableList);
  }
}
