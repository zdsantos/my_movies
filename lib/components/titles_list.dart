import 'package:flutter/material.dart';
import 'package:my_movies/components/title_card.dart';
import 'package:my_movies/models/movie.dart';

class TitlesList extends StatefulWidget {
  TitlesList({
    Key? key,
    required this.titles,
    this.orientation = Axis.horizontal,
    this.verticalColumnsCount = 2,
    this.onFinishScroll,
  }) : super(key: key);

  final List<Movie> titles;
  final Axis orientation;
  int verticalColumnsCount;
  void Function()? onFinishScroll;

  @override
  State<TitlesList> createState() => _TitlesListState();
}

class _TitlesListState extends State<TitlesList> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent &&
          widget.onFinishScroll != null) {
        print("finish scroll horizontal");
        widget.onFinishScroll!.call();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.orientation == Axis.horizontal
        ? SizedBox(
            height: MediaQuery.of(context).size.width * 0.5,
            child: ListView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              children: widget.titles.map((t) => TitleCard(title: t)).toList(),
            ),
          )
        : Expanded(
            child: GridView.count(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              childAspectRatio: 0.666,
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: widget.verticalColumnsCount < 1
                  ? 1
                  : widget.verticalColumnsCount,
              children: widget.titles.map((t) => TitleCard(title: t)).toList(),
            ),
          );
  }
}
