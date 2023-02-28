import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:post_app/core/cache/cache.dart';
import 'package:post_app/core/error/exception.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PublicNewsLocalDataSource implements Cache<List<PublicNewsModel>, PublicNewsParams> {
  final SharedPreferences preferences;

  PublicNewsLocalDataSource({required this.preferences});
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
    PublicNewsParams? params,
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
  Future<void> save(PublicNewsParams params) async {
    try {
      var savedNews = preferences.getStringList("savedNews") ?? [];
      var newsModelToString = jsonEncode(params.newsModel!.toJson());
      if (!savedNews.contains(newsModelToString)) {
        savedNews.add(newsModelToString);
        preferences.setStringList("savedNews", savedNews);
      }
    } on CacheException catch (e) {
      throw CacheFailure(e.toString());
    }
  }

  @override
  Future<void> saveSelecteds(PublicNewsParams params) async {
    try {
      if (params.selectedModels != null) {
        var savedNews = preferences.getStringList("savedNews") ?? [];
        for (var news in params.selectedModels!) {
          var newsModelToString = jsonEncode(news.toJson());
          if (!savedNews.contains(newsModelToString)) {
            savedNews.add(newsModelToString);
          }
        }
        preferences.setStringList("savedNews", savedNews);
      }
    } on CacheException catch (e) {
      throw CacheFailure(e.toString());
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

  List<PublicNewsModel> savedNewsConverter(List<String> data) {
    List<PublicNewsModel> response = data
        .map(
          (item) => PublicNewsModel.fromJson(
            jsonDecode(item),
          ),
        )
        .toList();
    return response;
  }
}

class PublicNewsParams {
  PublicNewsModel? newsModel;
  List<PublicNewsModel>? selectedModels;
  PublicNewsParams({
    this.newsModel,
    this.selectedModels,
  });
}
