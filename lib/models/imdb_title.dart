import 'package:my_movies/models/cast_member.dart';

class IMDBTitle {
  String id;
  String? title;
  String? titleType;
  int? year;
  String? imageUrl;
  int? runningTimeInMinutes;
  List<CastMember> principals;

  IMDBTitle({
    required this.id,
    required this.title,
    required this.titleType,
    required this.year,
    this.imageUrl,
    required this.runningTimeInMinutes,
    required this.principals,
  });

  factory IMDBTitle.fromJson(Map<String, dynamic> json) {
    List<CastMember> principals = json.containsKey('principals')
        ? (json['principals'] as List<dynamic>)
            .map((p) => CastMember.fromJson(p))
            .toList()
        : [];

    return IMDBTitle(
      id: json['id'],
      title: json['title'],
      titleType: json['titleType'],
      year: json.containsKey('year') ? (json['year'] as int) : null,
      imageUrl: json['image']?['url'],
      runningTimeInMinutes: json.containsKey('runningTimeInMinutes')
          ? (json['runningTimeInMinutes'] as int)
          : null,
      principals: principals,
    );
  }
}
