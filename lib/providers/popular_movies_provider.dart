import 'package:get_it/get_it.dart';
import 'package:my_movies/providers/movies_list_provider.dart';
import 'package:my_movies/services/themoviedb_service.dart';

class PopularMoviesProvider extends MoviesListProvider {
  PopularMoviesProvider() {
    var service = GetIt.I.get<TheMovieDBService>();
    fetchFunction =
        (int page) => service.fetchPopularByRegion("BR", page: page);

    fetchNextPage();
  }
}
