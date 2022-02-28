import 'package:flutter/material.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/paged_result.dart';
import 'package:my_movies/providers/provider_state.dart';

abstract class MoviesListProvider with ChangeNotifier {
  List<Movie> movies = [];
  late Future<PagedResult<Movie>> Function(int) fetchFunction;
  ProviderState _state = ProviderState.initial;
  bool hasMore = true;
  int page = 1;

  ProviderState get state => _state;

  void fetchNextPage() async {
    if (hasMore && state != ProviderState.loading) {
      _state = ProviderState.loading;
      notifyListeners();

      var result = await fetchFunction(page);

      page++;
      movies = [...movies, ...result.data];
      hasMore = result.page < result.totalPages;

      _state = ProviderState.success;
      notifyListeners();
    }
  }
}
