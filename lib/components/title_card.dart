import 'package:flutter/material.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/services/themoviedb_service.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/feature_flag.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';

class TitleCard extends StatefulWidget {
  const TitleCard({Key? key, required this.title}) : super(key: key);

  final Movie title;

  @override
  State<TitleCard> createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard> {
  void onCardTap() {
    print("click: ${widget.title.id}");
    Navigator.pushNamed(context, "/title", arguments: widget.title);
  }

  void onCardLongPress() {
    showInfoSnakbar(context, widget.title.title);
  }

  void onFavoriteTap() {
    print("favorite: ${widget.title.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPaddingSize / 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: AspectRatio(
          aspectRatio: 0.675,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [boxShadow],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 0.0,
                  child: ClipRRect(
                    borderRadius: defaultBorder,
                    child: Image(
                      image: NetworkImage(TheMovieDBService.buildImageUrl(
                          widget.title.posterPath)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: defaultBorder,
                      onTap: onCardTap,
                      onLongPress: onCardLongPress,
                    ),
                  ),
                ),
                ffFavoriteEnable
                    ? Positioned(
                        bottom: -defaultPaddingSize / 3,
                        right: -defaultPaddingSize / 3,
                        child: IconButton(
                          icon: Icon(
                            MyMoviesIcons.bookmark_empty,
                            color: kWhiteColor,
                            shadows: [boxShadow],
                          ),
                          onPressed: onFavoriteTap,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
