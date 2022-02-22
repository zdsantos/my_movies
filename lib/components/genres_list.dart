import 'package:flutter/material.dart';
import 'package:my_movies/widgets/tag.dart';
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
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: genres
            .map((g) => Tag(text: g.description, onPressed: () {}))
            .toList(),
      ),
    );
  }
}
