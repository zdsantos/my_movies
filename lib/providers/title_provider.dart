import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/models/cast_crew_member.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/movie_credits.dart';
import 'package:my_movies/models/movie_video.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/services/themoviedb_service.dart';

class TitleProvider with ChangeNotifier {
  TitleProvider(this.id) {
    _service = GetIt.I.get<TheMovieDBService>();
    _loadData();
  }

  final int id;
  late Movie movie;
  late MovieCredits credits;
  List<CastCrewMember> directors = [];
  List<CastCrewMember> producers = [];
  List<CastCrewMember> screenplayers = [];
  List<CastCrewMember> novelists = [];
  List<MovieVideo> videos = [];
  late TheMovieDBService _service;
  ProviderState _state = ProviderState.initial;

  _loadData() async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      movie = await _service.getMovie(id);
      credits = await _service.fetchMovieCredits(id);
      videos = await _service.fetchMovieVideos(id);

      searchCrewMembers();
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

  void searchCrewMembers() {
    directors = credits.crew.where((c) => c.job == "Director").toList();
    producers = credits.crew.where((c) => c.job == "Producer").toList();
    screenplayers = credits.crew.where((c) => c.job == "Screenplay").toList();
    novelists = credits.crew.where((c) => c.job == "Novel").toList();
  }
}
