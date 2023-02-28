// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:post_app/core/api/dio_client.dart';
import 'package:post_app/core/api/list_api.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';

abstract class PublicNewsRemoteDataSource {
  Future<Either<Failure, List<PublicNewsModel>>> fetchNews({required int newsCount});
}

class PublicNewsRemoteDataSourceImpl implements PublicNewsRemoteDataSource {
  final DioClient dioClient;
  PublicNewsRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<Either<Failure, List<PublicNewsModel>>> fetchNews({required int newsCount}) async {
    final response = await dioClient.getRequest<List<PublicNewsModel>>(
      ListAPI.publicNewsUrl(newsCount: newsCount),
      converter: newsConverter,
    );
    return response;
  }

  List<PublicNewsModel> newsConverter(dynamic remoteData) {
    List<PublicNewsModel> convertedList = (remoteData as List).map((e) => PublicNewsModel.fromJson(e)).toList();
    return convertedList;
  }
}
