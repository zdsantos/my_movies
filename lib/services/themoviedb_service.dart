import 'dart:convert';

import 'package:my_movies/models/genre/genre.dart';
import 'package:http/http.dart' as http;

class TheMovieDBService {
  TheMovieDBService(this.apiKey);

  final String apiKey;
  final String apiHost = "api.themoviedb.org";

  Future<List<Genre>> fetchMoviesGenre({String language = "pt-BR"}) async {
    final httpClient = http.Client();

    var response = await httpClient.get(
        buildUrl("/3/genre/tv/list", <String, String>{"language": language}));

    if (response.statusCode == 200) {
      final body = (json.decode(response.body)["genres"]) as List;
      return body.map((e) => Genre.fromJson(e)).toList();
    } else {
      throw Exception('error on: fetchMoviesGenre');
    }
  }

  Uri buildUrl(String path, Map<String, String> queryParameters) {
    Map<String, String> baseParameters = {"api_key": apiKey};
    baseParameters.addAll(queryParameters);

    return Uri(
        scheme: "https",
        host: apiHost,
        path: path,
        queryParameters: baseParameters);
  }
}
