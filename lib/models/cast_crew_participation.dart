import 'package:my_movies/utils/utils.dart';

class CastCrewParticipation {
  CastCrewParticipation({
    this.adult,
    required this.title,
    required this.id,
    required this.popularity,
    this.character,
    required this.creditId,
    this.department,
    this.job,
    required this.releaseDate,
    required this.voteCount,
    required this.voteAverage,
    required this.video,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    this.backdropPath,
    this.posterPath,
    required this.overview,
  });

  bool? adult;
  String title;
  int id;
  double popularity;
  String? character;
  String creditId;
  String? department;
  String? job;
  DateTime? releaseDate;
  int voteCount;
  double voteAverage;
  bool video;
  List<int> genreIds;
  String originalLanguage;
  String originalTitle;
  String? backdropPath;
  String? posterPath;
  String overview;

  factory CastCrewParticipation.fromJson(Map<String, dynamic> data) {
    List<int> genreIds = data.containsKey('genre_ids')
        ? (data['genre_ids'] as List<dynamic>).map((n) => n as int).toList()
        : [];

    return CastCrewParticipation(
      adult: data.containsKey("adult") ? data["adult"] as bool : null,
      title: data["title"],
      id: data["id"] as int,
      popularity: data.containsKey("popularity")
          ? castDoubleFromJson(data["popularity"])
          : 0.0,
      character: data.containsKey("character") ? data["character"] : null,
      creditId: data["credit_id"],
      department: data.containsKey("department") ? data["department"] : null,
      job: data.containsKey("job") ? data["job"] : null,
      genreIds: genreIds,
      originalLanguage: data["original_language"],
      originalTitle: data["original_title"],
      overview: data["overview"],
      releaseDate: data.containsKey("release_date")
          ? DateTime.tryParse(data["release_date"])
          : null,
      video: data["video"] as bool,
      voteAverage: data.containsKey("vote_average")
          ? castDoubleFromJson(data["vote_average"])
          : 0.0,
      voteCount: data.containsKey("vote_count") ? data["vote_count"] as int : 0,
      posterPath: data["poster_path"],
      backdropPath: data["backdrop_path"],
    );
  }
}
