// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:post_app/core/api/dio_client.dart';
import 'package:post_app/core/api/list_api.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/core/local_database/local_database.dart';

abstract class PublicNewsRemoteDataSource {
  Future<Either<Failure, List<PublicNew>>> fetchNews({required int newsCount});
}

class PublicNewsRemoteDataSourceImpl implements PublicNewsRemoteDataSource {
  final DioClient dioClient;
  PublicNewsRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<Either<Failure, List<PublicNew>>> fetchNews({required int newsCount}) async {
    final response = await dioClient.getRequest<List<PublicNew>>(
      ListAPI.publicNewsUrl(newsCount: newsCount),
      converter: newsConverter,
    );
    return response;
  }

  List<PublicNew> newsConverter(dynamic remoteData) {
    List<PublicNew> convertedList = (remoteData as List).map((e) => fromApitoPublicNew(e)).toList();
    return convertedList;
  }
}

PublicNew fromApitoPublicNew(Map<String, dynamic> json) {
  return PublicNew(
    title: json['title']['rendered']??"empty",
    link: json['link'],
    jetpackFeaturedMediaUrl: json['jetpack_featured_media_url'],
    date: json['date']
  );
}

