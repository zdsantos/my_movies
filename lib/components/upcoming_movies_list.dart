import 'package:flutter/material.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/providers/upcoming_movies_provider.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';
import 'package:provider/provider.dart';

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
          child: Builder(
            builder: (context) {
              final provider = Provider.of<UpcomingMoviesProvider>(context);
              switch (provider.state) {
                case ProviderState.success:
                  return TitlesList(titles: provider.movies);
                case ProviderState.error:
                  return Center(
                    child: const Text("error on fetch upcoming").error(),
                  );
                case ProviderState.loading:
                  return Center(child: defaultProgressIndicator());
                default:
                  return Center(child: defaultProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
