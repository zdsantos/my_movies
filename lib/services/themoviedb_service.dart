import 'dart:convert';

import 'package:my_movies/models/genre/genre.dart';
import 'package:http/http.dart' as http;

class TheMovieDBService {
  TheMovieDBService(this._apiKey);

  final String _apiKey;
  final String _apiHost = "api.themoviedb.org";

  Future<List<Genre>> fetchMoviesGenre({String language = "en-US"}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
        _buildUrl("/3/genre/tv/list", <String, String>{"language": language}));

    if (response.statusCode == 200) {
      final body = (json.decode(response.body)["genres"]) as List;
      return body.map((e) => Genre.fromJson(e)).toList();
    } else {
      throw Exception('error on: fetchMoviesGenre');
    }
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
}
