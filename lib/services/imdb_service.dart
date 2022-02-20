import 'dart:async';
import 'dart:convert';

import 'package:my_movies/models/api_result.dart';
import 'package:my_movies/models/genre.dart';
import 'package:my_movies/models/imdb_title.dart';
import 'package:http/http.dart' as http;
import 'package:my_movies/utils/utils.dart';

class IMDbService {
  final String _apiHost = "imdb8.p.rapidapi.com";
  String _xRapidApiKey = "";
  String _xRapidApiHost = "";

  IMDbService(String xRapidApiKey, String xRapidApiHost) {
    _xRapidApiKey = xRapidApiKey;
    _xRapidApiHost = xRapidApiHost;
  }

  Future<ApiResult<List<IMDBTitle>>> findTitles(String query) async {
    const String path = "/title/find";

    try {
      final Uri uri = _buildUri(path, queryParameters: <String, String>{
        "q": query,
      });

      final response = await http.get(uri, headers: _buildHeaders());

      if (response.statusCode == 200) {
        List<IMDBTitle> titles = (json.decode(response.body)['results'] as List)
            .map((data) => IMDBTitle.fromJson(data))
            .toList();

        return ApiResult(success: true, data: titles);
      } else {
        return ApiResult(
          error:
              'connection_failed[findTitles]: status_code ${response.statusCode}',
        );
      }
    } catch (e) {
      return ApiResult(error: e.toString());
    }
  }

  Future<ApiResult<List<Genre>>> getGenres() async {
    const String path = "/title/list-popular-genres";

    try {
      final Uri uri = _buildUri(path);

      final response = await http.get(uri, headers: _buildHeaders());

      if (response.statusCode == 200) {
        List<Genre> titles = (json.decode(response.body)['genres'] as List)
            .map((data) => Genre.fromJson(data))
            .toList();

        return ApiResult(success: true, data: titles);
      } else {
        return ApiResult(
          error:
              'connection_failed[getGenres]: status_code ${response.statusCode}',
        );
      }
    } catch (e) {
      return ApiResult(error: e.toString());
    }
  }

  Future<ApiResult<IMDBTitle>> getTitle(String id) async {
    const String path = "/title/get-base";

    try {
      final Uri uri = _buildUri(path, queryParameters: {"tconst": cleanId(id)});

      final response = await http.get(uri, headers: _buildHeaders());

      if (response.statusCode == 200) {
        IMDBTitle title = IMDBTitle.fromJson(json.decode(response.body));

        return ApiResult(success: true, data: title);
      } else {
        return ApiResult(
          error:
              'connection_failed[getTitle]: status_code ${response.statusCode}',
        );
      }
    } catch (e) {
      return ApiResult(error: e.toString());
    }
  }

  Stream<IMDBTitle> getMoviesByGenre(
    String genreEndpoint, {
    int page = 1,
  }) {
    const String path = "/title/get-popular-movies-by-genre";
    final StreamController<IMDBTitle> streamController =
        StreamController<IMDBTitle>();

    if (page < 1) throw Exception("Page must be 1 or greater");

    try {
      final Uri uri =
          _buildUri(path, queryParameters: {"genre": genreEndpoint});

      http.get(uri, headers: _buildHeaders()).then((response) async {
        if (response.statusCode == 200) {
          List<String> titlesId = (json.decode(response.body) as List)
              .map((data) => data.toString())
              .toList();

          int init = (page - 1) * 20;
          int limit = init > titlesId.length ? -1 : init + 20;
          for (var i = init; i < limit; i++) {
            var result = await getTitle(titlesId[i]);

            if (result.success) {
              streamController.sink.add(result.data!);
            } else {
              streamController.sink.addError('error: null title');
            }
          }

          streamController.sink.close();
        } else {
          var error =
              'connection_failed[getMoviesByByGenre]: status_code ${response.statusCode}';

          streamController.sink.addError(error);
          streamController.sink.close();
        }
      }).catchError((e) {
        streamController.sink.addError(e);
        streamController.sink.close();
      });
    } catch (e) {
      streamController.sink.addError(e);
      streamController.sink.close();
    }

    return streamController.stream;
  }

  Uri _buildUri(String path, {Map<String, String>? queryParameters}) {
    final Uri uri = Uri(
      scheme: 'https',
      host: _apiHost,
      path: path,
      queryParameters: queryParameters,
    );

    return uri;
  }

  Map<String, String> _buildHeaders() {
    return <String, String>{
      "x-rapidapi-key": _xRapidApiKey,
      "x-rapidapi-host": _xRapidApiHost,
    };
  }
}
