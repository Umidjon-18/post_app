import 'dart:convert';

import '../../core/local_database/local_database.dart';

List<PublicNew> savedNewsConverter(List<String> data) {
  List<PublicNew> response = data
      .map(
        (item) => PublicNew.fromJson(
          jsonDecode(item),
        ),
      )
      .toList();
  return response;
}
