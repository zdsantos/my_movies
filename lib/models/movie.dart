import 'package:my_movies/models/company.dart';
import 'package:my_movies/models/country.dart';
import 'package:my_movies/models/genre.dart';
import 'package:my_movies/models/language.dart';
import 'package:my_movies/utils/utils.dart';

class Movie {
  Movie({
    required this.adult,
    this.backdropPath,
    this.budget = 0,
    this.genres = const <Genre>[],
    this.homepage,
    required this.id,
    this.imdbId,
    this.originalLanguage = "",
    required this.originalTitle,
    this.overview,
    this.popularity = 0,
    this.posterPath,
    this.productionCompanies = const <Company>[],
    this.productionCountries = const <Country>[],
    required this.releaseDate,
    this.revenue = 0,
    this.runtime,
    this.spokenLanguages = const <Language>[],
    required this.status,
    this.tagLine,
    required this.title,
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  bool adult;
  String? backdropPath;
  double? budget;
  List<Genre> genres;
  String? homepage;
  int id;
  String? imdbId;
  String originalLanguage;
  String originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  List<Company> productionCompanies;
  List<Country> productionCountries;
  DateTime? releaseDate;
  double? revenue;
  int? runtime;
  List<Language> spokenLanguages;
  String? status; // to enum
  String? tagLine;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory Movie.fromJson(Map<String, dynamic> data) {
    List<Genre> genres = data.containsKey('genres')
        ? (data['genres'] as List<dynamic>)
            .map((p) => Genre.fromJson(p))
            .toList()
        : [];

    List<Company> productionCompanies = data.containsKey('production_companies')
        ? (data['production_companies'] as List<dynamic>)
            .map((p) => Company.fromJson(p))
            .toList()
        : [];

    List<Country> productionCountries = data.containsKey('production_countries')
        ? (data['production_countries'] as List<dynamic>)
            .map((p) => Country.fromJson(p))
            .toList()
        : [];

    List<Language> spokenLanguages = data.containsKey('spoken_languages')
        ? (data['spoken_languages'] as List<dynamic>)
            .map((p) => Language.fromJson(p))
            .toList()
        : [];

    return Movie(
      adult: data["adult"] as bool,
      id: data["id"] as int,
      originalTitle: data["original_title"],
      releaseDate: data.containsKey("release_date")
          ? DateTime.tryParse(data["release_date"])
          : null,
      status: data.containsKey("status") ? data["status"] : null,
      title: data["title"],
      genres: genres,
      productionCompanies: productionCompanies,
      productionCountries: productionCountries,
      spokenLanguages: spokenLanguages,
      backdropPath:
          data.containsKey("backdrop_path") ? data["backdrop_path"] : null,
      homepage: data.containsKey("homepage") ? data["homepage"] : null,
      imdbId: data.containsKey("imdb_id") ? data["imdb_id"] : null,
      overview: data.containsKey("overview") ? data["overview"] : null,
      posterPath: data.containsKey("poster_path") ? data["poster_path"] : null,
      runtime: data.containsKey("runtime") && data["runtime"] != null
          ? data["runtime"] as int
          : null,
      budget: data.containsKey("budget")
          ? castDoubleFromJson(data["budget"])
          : null,
      originalLanguage: data.containsKey("original_language")
          ? data["original_language"]
          : null,
      popularity: data.containsKey("popularity")
          ? castDoubleFromJson(data["popularity"])
          : 0.0,
      revenue: data.containsKey("revenue")
          ? castDoubleFromJson(data["revenue"])
          : null,
      tagLine: data.containsKey("tagline") ? data["tagline"] : null,
      video: data["video"] ? data["video"] as bool : false,
      voteAverage: data.containsKey("vote_average")
          ? castDoubleFromJson(data["vote_average"])
          : 0.0,
      voteCount: data.containsKey("vote_count") ? data["vote_count"] as int : 0,
    );
  }
}
