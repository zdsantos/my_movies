import 'package:flutter/material.dart';
import 'package:my_movies/components/titles_list_with_provider.dart';
import 'package:my_movies/providers/trending_movies_provider.dart';
import 'package:my_movies/utils/styles.dart';

class TrendingMoviesList extends StatelessWidget {
  const TrendingMoviesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: defaultHPadding,
          child: const Text("Tendências").h3(),
        ),
        Center(
          child: TitlesListWithProvider<TrendingMoviesProvider>(),
        ),
      ],
    );
  }
}
