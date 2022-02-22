part of 'genre_bloc.dart';

enum GenreStatus { initial, success, failure }

class GenreState extends Equatable {
  const GenreState({
    this.status = GenreStatus.initial,
    this.genres = const <Genre>[],
  });

  final GenreStatus status;
  final List<Genre> genres;

  GenreState copyWith({
    GenreStatus? status,
    List<Genre>? genres,
  }) {
    return GenreState(
      status: status ?? this.status,
      genres: genres ?? this.genres,
    );
  }

  @override
  String toString() {
    return '''GenreState { status: $status, Genres: ${genres.length} }''';
  }

  @override
  List<Object> get props => [status, genres];
}
