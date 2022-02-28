import 'package:flutter/material.dart';
import 'package:my_movies/components/titles_list_with_provider.dart';
import 'package:my_movies/providers/popular_movies_provider.dart';
import 'package:my_movies/utils/styles.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: defaultHPadding,
          child: const Text("Populares").h3(),
        ),
        Center(
          child: TitlesListWithProvider<PopularMoviesProvider>(),
        )
      ],
    );
  }
}
