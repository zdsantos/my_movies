import 'package:flutter/material.dart';
import 'package:my_movies/components/titles_list_with_provider.dart';
import 'package:my_movies/providers/upcoming_movies_provider.dart';
import 'package:my_movies/utils/styles.dart';

class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: defaultHPadding,
          child: const Text("Próximas estreias").h3(),
        ),
        Center(
          child: TitlesListWithProvider<UpcomingMoviesProvider>(),
        ),
      ],
    );
  }
}
