import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/search_data.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/services/themoviedb_service.dart';

class SearchProvider with ChangeNotifier {
  SearchProvider(this.searchData) {
    _service = GetIt.I.get<TheMovieDBService>();
    _loadData();
  }

  final SearchData searchData;
  late List<Movie> resultList = [];
  late TheMovieDBService _service;
  ProviderState _state = ProviderState.initial;

  _loadData() async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      var result = <Movie>[];
      if (searchData.searchTerm != null) {
        result = await _service.fetchMoviesByTerm(searchData.searchTerm!);
      } else if (searchData.searchGenre != null) {
        result = await _service.fetchMoviesByTerm(searchData.searchGenre!.name);
      }

      resultList = result;
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
