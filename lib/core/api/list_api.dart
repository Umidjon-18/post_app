class ListAPI {
  static const String publicNewsBaseUrl = "https://techcrunch.com";
  static const String factsBaseUrl = "https://api.api-ninjas.com";
  static const String randomImageBaseUrl = "https://api.api-ninjas.com";
  static const String wordDefinitionBaseUrl = "https://api.api-ninjas.com";

  static String publicNewsUrl({required int newsCount}) =>
      "$publicNewsBaseUrl/wp-json/wp/v2/posts?per_page=$newsCount&context=embed";

  static String factsUrl({required int factCount}) => "$factsBaseUrl//v1/facts?limit=$factCount";

  static String randomImageUrl({required String category}) => "$randomImageBaseUrl/v1/randomimage?category=$category";

  static String wordDefinitionUrl({required String word}) => "$wordDefinitionBaseUrl/v1/dictionary?word=$word";
}
