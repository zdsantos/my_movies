import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/search_data.dart';
import 'package:my_movies/services/themoviedb_service.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/feature_flag.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';
import 'package:my_movies/widgets/base_container.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key, required this.searchData})
      : super(key: key);

  final SearchData searchData;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool isLoading = false;
  List<Movie> movies = <Movie>[];

  final TheMovieDBService _service = GetIt.I.get<TheMovieDBService>();

  @override
  initState() {
    super.initState();

    var newList = <Movie>[];

    setState(() {
      isLoading = true;
    });

    if (widget.searchData.searchTerm != null) {
      _service.fetchMoviesByTerm(widget.searchData.searchTerm!).then((value) {
        newList = value;
        setState(() {
          isLoading = false;
          movies = newList;
        });
      }).catchError(onError);
    } else if (widget.searchData.searchGenre != null) {
      _service.mockMovies().then((value) {
        newList = value;
        setState(() {
          isLoading = false;
          movies = newList;
        });
      }).catchError(onError);
    }
  }

  FutureOr<Null> onError(error, stackTrace) {
    print(stackTrace);
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: double.infinity,
      child: Stack(
        children: [
          isLoading
              ? SingleChildScrollView(
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
                                  text: widget.searchData.searchGenre != null
                                      ? "\"${widget.searchData.searchGenre!.name}\""
                                      : "\"${widget.searchData.searchTerm!}\"",
                                  style: StyledTexts.subheadStyle()
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      vSpacerSmall,
                      Center(
                        child: TitlesList(
                          titles: movies,
                          orientation: Axis.vertical,
                        ),
                      ),
                    ],
                  ),
                )
              : Center(child: defaultProgressIndicator()),
          ffProfileEnable
              ? Positioned(
                  child:
                      SolidIconButton(icon: MyMoviesIcons.person, onTap: () {}),
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
    );
  }
}
