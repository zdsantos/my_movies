import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/search_data.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/services/themoviedb_service.dart';

class SearchProvider with ChangeNotifier {
  GenreProvider(SearchData searchData) {
    _service = GetIt.I.get<TheMovieDBService>();
    _loadData();
    data = searchData;
  }

  List<Movie> movie = [];
  late TheMovieDBService _service;
  late SearchData data;
  ProviderState _state = ProviderState.initial;

  _loadData() async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      var result = <Movie>[];
      if (data.searchTerm != null) {
        result = await _service.fetchMoviesByTerm(data.searchTerm!);
      } else if (data.searchGenre != null) {
        // search by genre
      }

      movie = result;
      _state = ProviderState.success;
    } catch (e) {
      print(e);
      _state = ProviderState.error;
    }
    notifyListeners();
  }

  ProviderState get state => _state;

  void reload() {
    _loadData();
  }
}
