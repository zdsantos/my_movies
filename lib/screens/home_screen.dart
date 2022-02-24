import 'package:flutter/material.dart';
import 'package:my_movies/components/genres_list.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/imdb_title.dart';
import 'package:my_movies/models/search_data.dart';
import 'package:my_movies/providers/genre_provider.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/feature_flag.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';
import 'package:my_movies/widgets/base_container.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';
import 'package:my_movies/widgets/text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return MultiProvider(
        providers: [
          ListenableProvider<GenreProvider>(
              create: (context) => GenreProvider()),
        ],
        child: BaseContainer(
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ffProfileEnable
                          ? defaultPaddingSize * 4
                          : defaultPaddingSize,
                    ),
                    Padding(
                      padding: defaultHPadding,
                      child: BoxTextField(
                        controller: _searchController,
                        trailing: const Icon(
                          MyMoviesIcons.search,
                          color: kWhiteColor,
                          size: defaultIconSize,
                        ),
                        trailingTapped: () => Navigator.pushNamed(
                            context, "/search",
                            arguments:
                                SearchData(searchTerm: _searchController.text)),
                      ),
                    ),
                    vSpacer,
                    Builder(
                      builder: (context) {
                        final genreProvider =
                            Provider.of<GenreProvider>(context);
                        switch (genreProvider.state) {
                          case ProviderState.success:
                            return GenresList(genres: genreProvider.genres);
                          case ProviderState.error:
                            return Center(
                              child: const Text("error on fetch genres").body(
                                  style: const TextStyle(color: Colors.red)),
                            );
                          case ProviderState.loading:
                            return Center(child: defaultProgressIndicator());
                          default:
                            return Center(child: defaultProgressIndicator());
                        }
                      },
                    ),
                    vSpacer,
                    Padding(
                      padding: defaultHPadding,
                      child: const Text("Trending").h1(),
                    ),
                    vSpacerSmall,
                    Center(
                      child: TitlesList(
                        titles: IMDBTitle.mocList,
                        orientation: Axis.vertical,
                      ),
                    ),
                  ],
                ),
              ),
              ffProfileEnable
                  ? Positioned(
                      child: SolidIconButton(
                          icon: MyMoviesIcons.person, onTap: () {}),
                      right: defaultPaddingSize,
                      top: defaultPaddingSize,
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
