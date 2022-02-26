import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_movies/components/genres_list.dart';
import 'package:my_movies/models/cast_crew_member.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/movie_video.dart';
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
import 'package:my_movies/widgets/tag.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleScreen extends StatefulWidget {
  TitleScreen({Key? key, required Movie title}) : super(key: key) {
    titleId = title.id;
  }

  late int titleId;

  @override
  _TitleScreenState createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  void _launchVideo(List<MovieVideo> videos) {
    int i = 0;
    do {
      try {
        launch(TheMovieDBService.buildVideoUrl(videos[i].key));
        return;
      } catch (e) {
        i++;
      }
    } while (i <= videos.length);
    showInfoSnakbar(context, "Não foi possível abrir o vídeo", isError: true);
  }

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
              return _buildTitleView(provider);
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

  Widget _buildTitleView(TitleProvider provider) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(provider),
              vSpacerSmall,
              GenresList(genres: provider.movie.genres),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOverviewSection(provider.movie),
                  _buildBaseInfosSection(provider.movie),
                  _buildCreditsList(provider),
                  SizedBox(
                    height: defaultPaddingSize * 4,
                  ),
                ],
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

  Stack _buildBanner(TitleProvider provider) {
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
                    provider.movie.backdropPath ?? provider.movie.posterPath))),
          ),
        ),
        _buildVideoButton(provider.videos),
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
                  provider.movie.title,
                ).h2(),
                vSpacerMin
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoButton(List<MovieVideo> videos) {
    return videos.isNotEmpty
        ? Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: IconButton(
                iconSize: 60,
                icon: Icon(
                  Icons.play_circle_fill_rounded,
                  color: kDarkColor.withOpacity(0.8),
                ),
                onPressed: () {
                  _launchVideo(videos);
                },
              ),
            ),
          )
        : Container();
  }

  Widget _buildOverviewSection(Movie movie) {
    return movie.overview!.isNotEmpty
        ? Padding(
            padding: defaultHPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionDivider(),
                Text(movie.overview!).body(),
              ],
            ),
          )
        : Container();
  }

  Widget _buildBaseInfosSection(Movie movie) {
    return Padding(
      padding: defaultHPadding,
      child: Column(
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
                  text:
                      "${movie.voteAverage.toString()} (de ${movie.voteCount} avaliações)",
                  style: StyledTexts.bodyStyle()
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          movie.releaseDate != null
              ? Text.rich(
                  TextSpan(
                    text: "Ano: ",
                    style: StyledTexts.bodyStyle()
                        .copyWith(fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: DateFormat("MMM/yyyy").format(movie.releaseDate!),
                        style: StyledTexts.bodyStyle()
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              : Container(),
          movie.runtime != null
              ? Text.rich(
                  TextSpan(
                    text: "Duração: ",
                    style: StyledTexts.bodyStyle()
                        .copyWith(fontWeight: FontWeight.w600),
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
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildCreditsList(TitleProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionDivider(),
        provider.directors.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: defaultHPadding,
                    child: const Text("Dirigido por").body(
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  _buildCastCrewList(provider.directors)
                ],
              )
            : Container(),
        provider.screenplayers.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: defaultHPadding,
                    child: const Text("Roterizado por").body(
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  _buildCastCrewList(provider.screenplayers)
                ],
              )
            : Container(),
        provider.credits.cast.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: defaultHPadding,
                    child: const Text("Elenco").body(
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  _buildCastCrewList(provider.credits.cast)
                ],
              )
            : Container(),
      ],
    );
  }

  Widget _buildCastCrewList(List<CastCrewMember> list) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Wrap(
        spacing: defaultPaddingSize / 2,
        children: [
          vSpacerSmall,
          ...list
              .map(
                (c) => Tag(
                  text: c.name,
                  info: c.character,
                  onPressed: () {},
                  avatarImage: NetworkImage(
                    TheMovieDBService.buildImageUrl(c.profilePath),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
