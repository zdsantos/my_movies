import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movies/components/genres_list.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/providers/title_provider.dart';
import 'package:my_movies/services/themoviedb_service.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/feature_flag.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';
import 'package:my_movies/widgets/base_container.dart';
import 'package:my_movies/widgets/section_divider.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';
import 'package:provider/provider.dart';

class TitleScreen extends StatefulWidget {
  TitleScreen({Key? key, required Movie title}) : super(key: key) {
    titleId = title.id;
  }

  late int titleId;

  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<TitleProvider>(
            create: (context) => TitleProvider(widget.titleId)),
      ],
      child: BaseContainer(
        height: double.infinity,
        child: Builder(builder: (context) {
          var provider = Provider.of<TitleProvider>(context);

          switch (provider.state) {
            case ProviderState.success:
              return _buildTitleView(provider.movie);
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
        }),
      ),
    );
  }

  Widget _buildTitleView(Movie movie) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(movie),
              vSpacerSmall,
              GenresList(genres: movie.genres),
              Padding(
                padding: defaultHPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOverviewSection(movie),
                    _baseInfosSection(movie),
                  ],
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
    );
  }

  Stack _buildBanner(Movie movie) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [boxShadow],
            ),
            child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(TheMovieDBService.buildBannerImageUrl(
                    movie.backdropPath!))),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: defaultHPadding,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [kDarkColor, Colors.transparent],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                ).h2(),
                vSpacerMin
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOverviewSection(Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionDivider(),
        Text(movie.overview!).body(),
      ],
    );
  }

  Widget _baseInfosSection(Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionDivider(),
        Text.rich(
          TextSpan(
            text: "Avaliação: ",
            style:
                StyledTexts.bodyStyle().copyWith(fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: movie.voteAverage.toString(),
                style: StyledTexts.bodyStyle()
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            text: "Ano: ",
            style:
                StyledTexts.bodyStyle().copyWith(fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: movie.releaseDate.year.toString(),
                style: StyledTexts.bodyStyle()
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            text: "Duração: ",
            style:
                StyledTexts.bodyStyle().copyWith(fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: movie.runtime.toString(),
                style: StyledTexts.bodyStyle()
                    .copyWith(fontWeight: FontWeight.w400),
                children: const [
                  TextSpan(text: " minutos"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
