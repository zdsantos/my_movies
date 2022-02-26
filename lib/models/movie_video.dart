class MovieVideo {
  MovieVideo({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  String iso_639_1;
  String iso_3166_1;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  DateTime? publishedAt;
  String id;

  factory MovieVideo.fromJson(Map<String, dynamic> data) {
    return MovieVideo(
      iso_639_1: data["iso_639_1"],
      iso_3166_1: data["iso_3166_1"],
      name: data["name"],
      key: data["key"],
      site: data["site"],
      size: data["size"] as int,
      type: data["type"],
      official: data["official"] as bool,
      publishedAt: DateTime.tryParse(data["published_at"]),
      id: data["id"],
    );
  }
}
