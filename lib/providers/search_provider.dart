import 'package:get_it/get_it.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/paged_result.dart';
import 'package:my_movies/models/search_data.dart';
import 'package:my_movies/providers/movies_list_provider.dart';
import 'package:my_movies/services/themoviedb_service.dart';

class SearchProvider extends MoviesListProvider {
  SearchProvider(this.searchData) {
    _service = GetIt.I.get<TheMovieDBService>();
    fetchFunction = (int page) => _doSearch(page);

    fetchNextPage();
  }

  final SearchData searchData;
  late TheMovieDBService _service;

  Future<PagedResult<Movie>> _doSearch(int page) async {
    if (searchData.searchGenre != null) {
      return await _service.fetchMoviesByTerm(searchData.searchGenre!.name);
    }

    return await _service.fetchMoviesByTerm(searchData.searchTerm!);
  }
}
