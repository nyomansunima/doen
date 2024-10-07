class Intro {
  String id;
  String title;
  String description;
  String illustrationUrl;

  Intro(this.title, this.description, this.illustrationUrl, this.id);

  Intro.fromJson(Map<String, dynamic> dataMap, String id)
      : title = dataMap["title"],
        description = dataMap["description"],
        illustrationUrl = dataMap["illustrationUrl"],
        id = id;

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "illustrationUrl": illustrationUrl,
    };
  }
}
