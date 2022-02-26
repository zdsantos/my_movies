import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/search_data.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/providers/search_provider.dart';
import 'package:my_movies/services/themoviedb_service.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/feature_flag.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';
import 'package:my_movies/widgets/base_container.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key, required this.searchData})
      : super(key: key);

  final SearchData searchData;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<SearchProvider>(
            create: (context) => SearchProvider(searchData)),
      ],
      child: BaseContainer(
        height: double.infinity,
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                var provider = Provider.of<SearchProvider>(context);

                switch (provider.state) {
                  case ProviderState.success:
                    return _buildResultList(provider.resultList);
                  case ProviderState.error:
                    return Center(
                      child: const Text("error").error(),
                    );
                  case ProviderState.initial:
                  case ProviderState.loading:
                    return Center(
                      child: defaultProgressIndicator(),
                    );
                }
              },
            ),
            ffProfileEnable
                ? Positioned(
                    child: SolidIconButton(
                        icon: MyMoviesIcons.person, onTap: () {}),
                    right: defaultPaddingSize,
                    top: defaultPaddingSize,
                  )
                : Container(),
            Positioned(
              child: IconButton(
                  icon: const Icon(MyMoviesIcons.left_open,
                      color: kWhiteColor, size: defaultIconSize),
                  onPressed: () => Navigator.pop(context)),
              left: defaultPaddingSize / 2,
              top: defaultPaddingSize,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultList(List<Movie> result) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultPaddingSize * 4),
          Padding(
            padding: defaultHPadding,
            child: RichText(
              text: TextSpan(
                style: StyledTexts.subheadStyle(),
                children: [
                  const TextSpan(text: "Search result for: "),
                  TextSpan(
                      text: searchData.searchGenre != null
                          ? "\"${searchData.searchGenre!.name}\""
                          : "\"${searchData.searchTerm!}\"",
                      style: StyledTexts.subheadStyle()
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          vSpacerSmall,
          Center(
            child: result.isNotEmpty
                ? TitlesList(
                    titles: result,
                    orientation: Axis.vertical,
                  )
                : const Text("Nenhum resultado encontrado").body(),
          ),
        ],
      ),
    );
  }
}
