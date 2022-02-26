import 'package:flutter/material.dart';
import 'package:my_movies/components/title_card.dart';
import 'package:my_movies/models/movie.dart';

class TitlesList extends StatefulWidget {
  const TitlesList({
    Key? key,
    required this.titles,
    this.orientation = Axis.horizontal,
  }) : super(key: key);

  final List<Movie> titles;
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
            child: Wrap(
              spacing: 10,
              children: widget.titles.map((t) => TitleCard(title: t)).toList(),
            ),
          )
        : Wrap(
            spacing: 10,
            children: widget.titles.map((t) => TitleCard(title: t)).toList(),
          );
  }
}
