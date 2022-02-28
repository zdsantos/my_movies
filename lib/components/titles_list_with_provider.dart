import 'package:flutter/material.dart';
import 'package:my_movies/components/title_card.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/providers/movies_list_provider.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';
import 'package:provider/provider.dart';

class TitlesListWithProvider<T extends MoviesListProvider>
    extends StatefulWidget {
  TitlesListWithProvider({
    Key? key,
    this.orientation = Axis.horizontal,
    this.verticalColumnsCount = 2,
  }) : super(key: key);

  final Axis orientation;
  int verticalColumnsCount;

  @override
  State<TitlesListWithProvider> createState() =>
      _TitlesListWithProviderState<T>();
}

class _TitlesListWithProviderState<T extends MoviesListProvider>
    extends State<TitlesListWithProvider> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(
        () => Provider.of<T>(context, listen: false).fetchNextPage());

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print("finish scroll horizontal");
        Provider.of<T>(context, listen: false).fetchNextPage();
      }
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        print("finish scroll vertical");
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
    final provider = Provider.of<T>(context);

    if (provider.state == ProviderState.error) {
      return Center(child: const Text("error on fetch movies list").error());
    }

    if (provider.state == ProviderState.loading && provider.movies.isEmpty) {
      return Center(child: defaultProgressIndicator());
    }

    if (provider.state != ProviderState.loading && provider.movies.isEmpty) {
      return Center(child: const Text("Nenhum resultado encontrado").body());
    }

    return widget.orientation == Axis.horizontal
        ? SizedBox(
            height: MediaQuery.of(context).size.width * 0.5,
            child: ListView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              children: [
                ...provider.movies.map((t) => TitleCard(title: t)).toList(),
                provider.hasMore ? defaultProgressIndicator() : Container()
              ],
            ),
          )
        : GridView.count(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            childAspectRatio: 0.666,
            controller: _controller,
            physics: const ScrollPhysics(),
            crossAxisCount: widget.verticalColumnsCount < 1
                ? 1
                : widget.verticalColumnsCount,
            children: [
              ...provider.movies.map((t) => TitleCard(title: t)).toList(),
              provider.hasMore ? defaultProgressIndicator() : Container()
            ],
          );
  }
}
