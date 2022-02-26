import 'package:flutter/material.dart';
import 'package:my_movies/models/search_data.dart';
import 'package:my_movies/utils/styles.dart';
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
      child: Wrap(
        spacing: 10,
        children: [
          vSpacerSmall,
          ...(genres
              .map((g) => Tag(
                  text: g.name,
                  onPressed: () => Navigator.pushNamed(context, "/search",
                      arguments: SearchData(searchGenre: g))))
              .toList()),
          vSpacerSmall
        ],
      ),
    );
  }
}
