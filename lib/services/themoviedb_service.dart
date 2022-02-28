import 'dart:convert';

import 'package:my_movies/models/genre.dart';
import 'package:http/http.dart' as http;
import 'package:my_movies/models/language.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/movie_credits.dart';
import 'package:my_movies/models/movie_video.dart';
import 'package:my_movies/models/paged_result.dart';
import 'package:my_movies/models/person.dart';
import 'package:my_movies/models/person_credits.dart';

class TheMovieDBService {
  TheMovieDBService(this._apiKey);

  final String _apiKey;
  final String _apiHost = "api.themoviedb.org";

  Future<List<Genre>> fetchMoviesGenre(
      {String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
      _buildUrl("/3/genre/movie/list", <String, String>{"language": language}),
    );

    if (response.statusCode == 200) {
      final body = (json.decode(response.body)["genres"]) as List;
      return body.map((e) => Genre.fromJson(e)).toList();
    } else {
      throw Exception('error on: fetchMoviesGenre');
    }
  }

  Future<PagedResult<Movie>> fetchMoviesByTerm(String term,
      {int page = 1,
      bool includeAdult = false,
      String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
      _buildUrl(
        "/3/search/movie",
        <String, String>{
          "query": term,
          "page": page.toString(),
          "include_adult": includeAdult.toString(),
          "language": language,
        },
      ),
    );

    if (response.statusCode == 200) {
      final result = PagedResult<Movie>.fromJson(
          json.decode(response.body), Movie.fromJson);

      return result;
    } else {
      throw Exception('error on: fetchMoviesByTerm');
    }
  }

  Future<PagedResult<Movie>> fetchTrendingMovies(
      {String timeWindow = "week",
      int page = 1,
      String language = LanguageCode.pt_BR}) {
    return _fetchTrending("movie",
        page: page, timeWindow: timeWindow, language: language);
  }

  Future<PagedResult<Movie>> _fetchTrending(String mediaType,
      {String timeWindow = "week",
      int page = 1,
      String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    if (mediaType.isEmpty) throw ArgumentError.notNull(mediaType);

    String path = "/3/trending/$mediaType/$timeWindow";

    var response = await httpClient.get(_buildUrl(
      path,
      <String, String>{
        "language": language,
        "page": page.toString(),
      },
    ));

    if (response.statusCode == 200) {
      final result = PagedResult<Movie>.fromJson(
          json.decode(response.body), Movie.fromJson);

      return result;
    } else {
      throw Exception('error on: _fetchTrending#$mediaType');
    }
  }

  Future<PagedResult<Movie>> fetchUpcomingMovies(String region,
      {int page = 1, String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    String path = "/3/movie/upcoming";

    var response = await httpClient.get(_buildUrl(
      path,
      <String, String>{
        "region": region,
        "language": language,
        "page": page.toString(),
      },
    ));

    if (response.statusCode == 200) {
      final result = PagedResult<Movie>.fromJson(
          json.decode(response.body), Movie.fromJson);

      return result;
    } else {
      throw Exception('error on: _fetchUpcoming');
    }
  }

  Future<PagedResult<Movie>> fetchPopularByRegion(String region,
      {int page = 1, String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    if (region.isEmpty) throw ArgumentError.notNull(region);

    String path = "/3/movie/popular";

    try {
      var response = await httpClient.get(_buildUrl(
        path,
        <String, String>{
          "region": region,
          "page": page.toString(),
          "language": language,
        },
      ));

      if (response.statusCode == 200) {
        final result = PagedResult<Movie>.fromJson(
            json.decode(response.body), Movie.fromJson);

        return result;
      } else {
        final body = (json.decode(response.body));
        throw Exception(
            'error during fetchPopularByRegion#$region: ${body["status_message"].toString()}');
      }
    } catch (e) {
      throw Exception(
          'error on: fetchPopularByRegion#$region: ${e.toString()}');
    }
  }

  Future<Movie> getMovie(int movieId,
      {String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
      _buildUrl("/3/movie/$movieId", <String, String>{"language": language}),
    );

    if (response.statusCode == 200) {
      final result = Movie.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('error on: getMovie#$movieId');
    }
  }

  Future<MovieCredits> fetchMovieCredits(int movieId,
      {String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
      _buildUrl(
          "/3/movie/$movieId/credits", <String, String>{"language": language}),
    );

    if (response.statusCode == 200) {
      final result = MovieCredits.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('error on: fetchMovieCredits#$movieId');
    }
  }

  Future<List<MovieVideo>> fetchMovieVideos(int movieId,
      {String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
      _buildUrl(
          "/3/movie/$movieId/videos", <String, String>{"language": language}),
    );

    if (response.statusCode == 200) {
      final body = (json.decode(response.body)["results"]) as List;
      var result = body.map((e) => MovieVideo.fromJson(e)).toList();

      return result;
    } else {
      throw Exception('error on: fetchMovieVideos#$movieId');
    }
  }

  Future<Person> getPerson(int personId,
      {String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    String path = "/3/person/$personId";

    var response = await httpClient
        .get(_buildUrl(path, <String, String>{"language": language}));

    if (response.statusCode == 200) {
      var result = Person.fromJson(json.decode(response.body));

      return result;
    } else {
      throw Exception('error on: getPerson#$personId');
    }
  }

  Future<PersonCredits> fetchPersonCredits(int personId,
      {String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
      _buildUrl("/3/person/$personId/movie_credits",
          <String, String>{"language": language}),
    );

    if (response.statusCode == 200) {
      final result = PersonCredits.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('error on: fetchPersonCredits#$personId');
    }
  }

  static String buildImageUrl(String? path) {
    if (path != null) {
      return "https://image.tmdb.org/t/p/w300_and_h450_bestv2/$path";
    }
    return "https://via.placeholder.com/450x300?text=Imagem+n%C3%A3o+dispon%C3%ADvel";
  }

  static String buildBannerImageUrl(String? path) {
    if (path != null) {
      return "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/$path";
    }
    return "https://via.placeholder.com/533x300?text=Imagem+n%C3%A3o+dispon%C3%ADvel";
  }

  static String buildVideoUrl(String key) {
    return "https://www.youtube.com/watch?v=$key";
  }

  Uri _buildUrl(String path, Map<String, String> queryParameters) {
    Map<String, String> baseParameters = {"api_key": _apiKey};
    baseParameters.addAll(queryParameters);

    return Uri(
        scheme: "https",
        host: _apiHost,
        path: path,
        queryParameters: baseParameters);
  }

  List<Movie> _sort(List<Movie> list) {
    list.sort((m1, m2) => m1.popularity.compareTo(m2.popularity) * -1);
    return list;
  }
}
