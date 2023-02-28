import 'package:dartz/dartz.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/core/usecase/usecase.dart';
import 'package:post_app/features/public_news/domain/repositories/public_news_repository.dart';

import '../../data/models/public_news_model.dart';

class GetPublicNewsUseCase implements UseCase<List<PublicNewsModel>, int> {
  final PublicNewsRepository publicNewsRepository;

  GetPublicNewsUseCase({required this.publicNewsRepository});
  @override
  Future<Either<Failure, List<PublicNewsModel>>> call(int params) async {
    return publicNewsRepository.getPublicNews(newsCount: params);
  }
}
