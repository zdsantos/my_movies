import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/services/themoviedb_service.dart';

class TitleProvider with ChangeNotifier {
  TitleProvider(this.id) {
    _service = GetIt.I.get<TheMovieDBService>();
    _loadData();
  }

  int id;
  late Movie movie;
  late TheMovieDBService _service;
  ProviderState _state = ProviderState.initial;

  _loadData() async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      var result = await _service.getMovie(id);
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
