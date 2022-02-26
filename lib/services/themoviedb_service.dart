import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_movies/models/genre.dart';
import 'package:http/http.dart' as http;
import 'package:my_movies/models/language.dart';
import 'package:my_movies/models/movie.dart';

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

  Future<List<Movie>> fetchMoviesByTerm(String term,
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
      final body = (json.decode(response.body)["results"]) as List;
      var result = body.map((e) => Movie.fromJson(e)).toList();

      return _sort(result);
    } else {
      throw Exception('error on: fetchMoviesByTerm');
    }
  }

  Future<List<Movie>> fetchTrendingMovies(
      {String timeWindow = "week", String language = LanguageCode.pt_BR}) {
    return _fetchTrending("movie", timeWindow: timeWindow, language: language);
  }

  Future<List<Movie>> _fetchTrending(String mediaType,
      {String timeWindow = "week",
      String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    if (mediaType.isEmpty) throw ArgumentError.notNull(mediaType);

    String path = "/3/trending/$mediaType/$timeWindow";

    var response = await httpClient
        .get(_buildUrl(path, <String, String>{"language": language}));

    if (response.statusCode == 200) {
      final body = (json.decode(response.body)["results"]) as List;
      var result = body.map((e) => Movie.fromJson(e)).toList();

      return _sort(result);
    } else {
      throw Exception('error on: _fetchTrending#$mediaType');
    }
  }

  Future<List<Movie>> fetchPopularByRegion(String region,
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
        final body = (json.decode(response.body)["results"]) as List;
        var result = body.map((e) => Movie.fromJson(e)).toList();

        return _sort(result);
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

  Future<Movie> getMovie(int id, {String language = LanguageCode.pt_BR}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
      _buildUrl("/3/movie/$id", <String, String>{"language": language}),
    );

    if (response.statusCode == 200) {
      final result = Movie.fromJson(json.decode(response.body));
      return result;
    } else {
      throw Exception('error on: getMovie#$id');
    }
  }

  Future<List<Movie>> mockMovies() async {
    Future.delayed(const Duration(seconds: 5));

    return <Movie>[
      Movie(
        adult: false,
        id: 550,
        originalTitle: "Fight Club",
        releaseDate: DateTime.parse("1999-10-15"),
        status: "Released",
        title: "Fight Club",
        posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
        popularity: 5855.3,
        genres: [
          const Genre(id: 18, name: "Drama"),
        ],
        backdropPath: "/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg",
        overview:
            "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
        runtime: 139,
        voteAverage: 8.4,
        voteCount: 23536,
      ),
      Movie(
        adult: false,
        id: 634649,
        originalTitle: "Spider-Man: No Way Home",
        releaseDate: DateTime.parse("2021-12-15"),
        status: "Released",
        title: "Spider-Man: No Way Home",
        posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
        popularity: 6575.499,
        genres: [
          const Genre(id: 28, name: "Action"),
          const Genre(id: 12, name: "Adventure"),
          const Genre(id: 878, name: "Science Fiction"),
        ],
        backdropPath: "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
        overview:
            "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
        runtime: 148,
        voteAverage: 8.3,
        voteCount: 8296,
      ),
    ];
  }

  static String buildImageUrl(String path) {
    return "https://image.tmdb.org/t/p/w300_and_h450_bestv2/$path";
  }

  static String buildBannerImageUrl(String path) {
    return "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/$path";
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
