import 'package:flutter/material.dart';
import 'package:my_movies/components/title_card.dart';
import 'package:my_movies/models/imdb_title.dart';
import 'package:my_movies/utils/utils.dart';

class TitlesList extends StatefulWidget {
  const TitlesList({
    Key? key,
    required this.titles,
    this.orientation = Axis.horizontal,
  }) : super(key: key);

  final List<IMDBTitle> titles;
  final Axis orientation;

  @override
  State<TitlesList> createState() => _TitlesListState();
}

class _TitlesListState extends State<TitlesList> {
  @override
  Widget build(BuildContext context) {
    return widget.orientation == Axis.horizontal
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: widget.titles.isEmpty
                ? defaultProgressIndicator()
                : Wrap(
                    spacing: 10,
                    children:
                        widget.titles.map((t) => TitleCard(title: t)).toList(),
                  ),
          )
        : widget.titles.isEmpty
            ? defaultProgressIndicator()
            : Wrap(
                spacing: 10,
                children:
                    widget.titles.map((t) => TitleCard(title: t)).toList(),
              );
  }
}
