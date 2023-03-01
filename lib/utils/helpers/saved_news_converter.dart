
  import 'dart:convert';

import '../../features/public_news/data/models/public_news_model.dart';

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