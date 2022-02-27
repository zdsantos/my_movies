import 'package:my_movies/models/cast_crew_participation.dart';

class PersonCredits {
  PersonCredits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<CastCrewParticipation> cast;
  List<CastCrewParticipation> crew;

  factory PersonCredits.fromJson(Map<String, dynamic> data) {
    var cast = ((data["cast"]) as List)
        .map((e) => CastCrewParticipation.fromJson(e))
        .toList();

    var crew = ((data["crew"]) as List)
        .map((e) => CastCrewParticipation.fromJson(e))
        .toList();

    return PersonCredits(
      id: data["id"] as int,
      cast: cast,
      crew: crew,
    );
  }
}
