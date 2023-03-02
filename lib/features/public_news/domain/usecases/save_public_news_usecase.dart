import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/public_news_repository.dart';

import '../../../../core/local_database/local_database.dart';
import 'public_news_params.dart';

class SavePublicNewsUseCase implements UseCase<bool, PublicNewsParams> {
  final PublicNewsRepository publicNewsRepository;

  SavePublicNewsUseCase({required this.publicNewsRepository});
  @override
  Future<Either<Failure, bool>> call(PublicNewsParams params) async {
    try {
      publicNewsRepository.saveNews(params.newsModel!);
      return const Right(true);
    } catch (e) {
      return const Left(CacheFailure("Could not save to local cache"));
    }
  }

  Future<Either<Failure, bool>> saveSelectedNews(
    List<PublicNew> selectedNews,
  ) async {
    try {
      publicNewsRepository.saveSelectedNews(selectedNews);
      return const Right(true);
    } catch (e) {
      return const Left(CacheFailure("Could not save to local cache"));
    }
  }
}
