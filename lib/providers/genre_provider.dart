import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/models/genre.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/services/themoviedb_service.dart';

class GenreProvider with ChangeNotifier {
  GenreProvider() {
    _service = GetIt.I.get<TheMovieDBService>();
    _loadData();
  }

  List<Genre> genres = [];
  late TheMovieDBService _service;
  ProviderState _state = ProviderState.initial;

  _loadData() async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      var result = await _service.fetchMoviesGenre();
      genres = result;
      _state = ProviderState.success;
    } catch (e) {
      debugPrint(e.toString());
      _state = ProviderState.error;
    }
    notifyListeners();
  }

  ProviderState get state => _state;

  void reload() {
    _loadData();
  }
}
