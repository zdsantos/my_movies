import 'package:my_movies/models/cast_crew_member.dart';

class MovieCredits {
  MovieCredits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<CastCrewMember> cast;
  List<CastCrewMember> crew;

  factory MovieCredits.fromJson(Map<String, dynamic> data) {
    var cast = ((data["cast"]) as List)
        .map((e) => CastCrewMember.fromJson(e))
        .toList();

    var crew = ((data["crew"]) as List)
        .map((e) => CastCrewMember.fromJson(e))
        .toList();

    return MovieCredits(
      id: data["id"] as int,
      cast: cast,
      crew: crew,
    );
  }
}
