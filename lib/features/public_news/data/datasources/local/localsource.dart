import 'dart:convert';

import 'package:post_app/core/error/exception.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/local_database/local_database.dart';

abstract class PublicNewsLocalDataSource {
  Future<void> save(PublicNewsParams params);
  Future<void> saveSelecteds(PublicNewsParams params);
}

class PublicNewsLocalDataSourceImpl implements PublicNewsLocalDataSource {
  final SharedPreferences preferences;

  PublicNewsLocalDataSourceImpl({required this.preferences});

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
}

class PublicNewsParams {
  PublicNew? newsModel;
  List<PublicNew>? selectedModels;
  PublicNewsParams({
    this.newsModel,
    this.selectedModels,
  });
}
