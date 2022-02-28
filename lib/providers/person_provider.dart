import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/models/person.dart';
import 'package:my_movies/models/person_credits.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/services/themoviedb_service.dart';

class PersonProvider with ChangeNotifier {
  PersonProvider(this.id) {
    _service = GetIt.I.get<TheMovieDBService>();
    _loadData();
  }

  final int id;
  late Person person;
  late PersonCredits credits;
  late TheMovieDBService _service;
  ProviderState _state = ProviderState.initial;

  _loadData() async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      person = await _service.getPerson(id);
      credits = await _service.fetchPersonCredits(id);

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
