import 'package:flutter/material.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/imdb_title.dart';
import 'package:my_movies/models/search_data.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/feature_flag.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/widgets/base_container.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key, required this.searchData})
      : super(key: key);

  final SearchData searchData;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Stack(
        children: [
          SingleChildScrollView(
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
