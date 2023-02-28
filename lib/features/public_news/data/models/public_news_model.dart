class PublicNewsModel {
  late Title title;
  late String link;
  late String jetpackFeaturedMediaUrl;
  late String date;

  PublicNewsModel({
    required this.title,
    required this.link,
    required this.jetpackFeaturedMediaUrl,
    required this.date,
  });

  PublicNewsModel.fromJson(Map<String, dynamic> json) {
    title = (json['title'] != null ? Title.fromJson(json['title']) : null)!;
    link = json['link'];
    jetpackFeaturedMediaUrl = json['jetpack_featured_media_url'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title.toJson();
    data['link'] = link;
    data['jetpack_featured_media_url'] = jetpackFeaturedMediaUrl;
    data['date'] = date;
    return data;
  }
}

class Title {
  late String rendered;

  Title({required this.rendered});

  Title.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    return data;
  }
}
