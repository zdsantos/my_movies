import 'package:flutter/material.dart';
import 'package:my_movies/components/genre_tag.dart';
import 'package:my_movies/models/genre.dart';

class GenresList extends StatelessWidget {
  const GenresList({
    Key? key,
    required this.genres,
  }) : super(key: key);

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: genres.map((g) => GenreTag(genre: g)).toList()

        // GenreTag(genre: Genre(description: "Action", endpoint: "")),
        // GenreTag(genre: Genre(description: "Adventure", endpoint: "")),
        // GenreTag(genre: Genre(description: "Comedy", endpoint: "")),
        // GenreTag(genre: Genre(description: "Terror", endpoint: "")),
        // GenreTag(genre: Genre(description: "Romance", endpoint: "")),
        // GenreTag(genre: Genre(description: "Animation", endpoint: "")),
        ,
      ),
    );
  }
}
