import 'package:flutter/material.dart';
import 'package:my_movies/components/title_card.dart';
import 'package:my_movies/models/imdb_title.dart';
import 'package:my_movies/utils/utils.dart';

class TitlesList extends StatefulWidget {
  TitlesList({Key? key, required this.builder}) : super(key: key);

  final List<IMDBTitle> titles = [];
  final Stream<IMDBTitle> builder;

  @override
  State<TitlesList> createState() => _TitlesListState();
}

class _TitlesListState extends State<TitlesList> {
  @override
  void initState() {
    super.initState();
    widget.builder.listen((title) {
      setState(() {
        widget.titles.add(title);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: widget.titles.isEmpty
          ? defaultProgressIndicator()
          : Row(
              children: widget.titles.map((t) => TitleCard(title: t)).toList(),
            ),
    );
  }
}
