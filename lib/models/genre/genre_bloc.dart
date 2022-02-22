import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies/models/genre/genre.dart';
import 'package:my_movies/services/themoviedb_service.dart';
import 'package:stream_transform/stream_transform.dart';

part 'genre_event.dart';
part 'genre_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDropable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc({required this.theMovieDBService}) : super(const GenreState()) {
    on<GenreFetched>(_onGenreFetched,
        transformer: throttleDropable(throttleDuration));
  }

  final TheMovieDBService theMovieDBService;

  Future<void> _onGenreFetched(
      GenreFetched event, Emitter<GenreState> emit) async {
    try {
      final result = await theMovieDBService.fetchMoviesGenre();

      return emit(state.copyWith(
        status: GenreStatus.success,
        genres: result,
      ));
    } catch (e) {
      emit(state.copyWith(status: GenreStatus.failure));
    }
  }
}
