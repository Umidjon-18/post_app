// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../utils/helpers/saved_news_converter.dart';
import '../../../../public_news/data/datasources/local/localsource.dart';
import '../../../../public_news/data/models/public_news_model.dart';

abstract class SavedNewsLocalDataSource {
  Future<Either<Failure, List<PublicNewsModel>>> deleteSaved(
    PublicNewsParams params,
  );
  Future<Either<Failure, List<PublicNewsModel>>> getSaveds(
  );
  Future<Either<Failure, List<PublicNewsModel>>> deleteSelectedSaveds(
    PublicNewsParams params,
  );
}

class SavedNewsLocalDataSourceImpl implements SavedNewsLocalDataSource {
  SharedPreferences preferences;
  SavedNewsLocalDataSourceImpl({
    required this.preferences,
  });
  @override
  Future<Either<Failure, List<PublicNewsModel>>> deleteSaved(
    PublicNewsParams params,
  ) async {
    try {
      var savedNews = preferences.getStringList("savedNews") ?? [];
      savedNews.remove(jsonEncode(params.newsModel!.toJson()));
      preferences.setStringList("savedNews", savedNews);
      return Right(savedNewsConverter(savedNews));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PublicNewsModel>>> getSaveds(
  ) async {
    try {
      var savedNews = preferences.getStringList("savedNews") ?? [];
      if (savedNews.isNotEmpty) {
        return Right(savedNewsConverter(savedNews));
      } else {
        return const Left(CacheFailure("Saved news not found"));
      }
    } on CacheException catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PublicNewsModel>>> deleteSelectedSaveds(
    PublicNewsParams params,
  ) async {
    try {
      if (params.selectedModels != null) {
        var savedNews = preferences.getStringList("savedNews") ?? [];
        for (var news in params.selectedModels!) {
          var newsModelToString = jsonEncode(news.toJson());
          if (!savedNews.contains(newsModelToString)) {
            savedNews.remove(newsModelToString);
          }
        }
        List<PublicNewsModel> newsModelList = savedNews
            .map((e) => PublicNewsModel.fromJson(
                  jsonDecode(e),
                ))
            .toList();
        preferences.setStringList("savedNews", savedNews);
        return Right(newsModelList);
      }
      return const Left(CacheFailure("Models does not selected"));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
