import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/core/usecase/usecase.dart';
import 'package:post_app/features/public_news/domain/repositories/public_news_repository.dart';

import '../../../../core/local_database/local_database.dart';

class GetPublicNewsUseCase implements UseCase<List<PublicNew>, int> {
  final PublicNewsRepository publicNewsRepository;

  GetPublicNewsUseCase({required this.publicNewsRepository});
  @override
  Future<Either<Failure, List<PublicNew>>> call(int params) async {
    return publicNewsRepository.getPublicNews(newsCount: params);
  }
}
