part of 'genre_bloc.dart';

abstract class GenreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GenreFetched extends GenreEvent {}
