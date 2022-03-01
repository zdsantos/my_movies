import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_movies/components/base_info.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/cast_crew_participation.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/models/person.dart';
import 'package:my_movies/providers/person_provider.dart';
import 'package:my_movies/providers/provider_state.dart';
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

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<PersonProvider>(
            create: (context) => PersonProvider(id)),
      ],
      child: BaseContainer(
        height: double.infinity,
        child: Builder(
          builder: (context) {
            var provider = Provider.of<PersonProvider>(context);

            switch (provider.state) {
              case ProviderState.success:
                return _buildPersonView(context, provider);
              case ProviderState.error:
                return Center(
                  child: const Text(
                          "Ocorreu um erro ao buscar informações do título")
                      .error(),
                );
              case ProviderState.initial:
              case ProviderState.loading:
              default:
                return Center(
                  child: defaultProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildPersonView(BuildContext context, PersonProvider provider) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(provider.person),
              _buildBaseInfosSection(provider.person),
              _buildOverviewSection(provider.person),
              _buildCastCrewSection("Atuou em", provider.credits.cast),
              _buildCastCrewSection("Participou de", provider.credits.crew),
              SizedBox(height: defaultPaddingSize * 2)
            ],
          ),
        ),
        ffProfileEnable
            ? Positioned(
                child:
                    SolidIconButton(icon: MyMoviesIcons.person, onTap: () {}),
                right: defaultPaddingSize,
                top: defaultPaddingSize * 2,
              )
            : Container(),
        Positioned(
          child: IconButton(
              icon: const Icon(MyMoviesIcons.left_open,
                  color: kWhiteColor, size: defaultIconSize),
              onPressed: () => Navigator.pop(context)),
          left: defaultPaddingSize / 2,
          top: defaultPaddingSize * 2,
        ),
      ],
    );
  }

  Widget _buildBanner(Person person) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: defaultPaddingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            vSpacer,
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [boxShadow],
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: defaultBorder,
                  child: CachedNetworkImage(
                    imageUrl: TheMovieDBService.buildProfileImageUrl(
                        person.profilePath),
                    placeholder: (context, _) => defaultProgressIndicator(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            vSpacerSmall,
            Container(
              padding: defaultHPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    person.name,
                  ).h2(),
                  vSpacerMin
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBaseInfosSection(Person person) {
    String birthdayText = "";
    String deathdayText = "";

    if (person.birthday != null) {
      birthdayText = DateFormat("dd/MMM/yyyy").format(person.birthday!);
    }

    if (person.deathday != null) {
      deathdayText = DateFormat("dd/MMM/yyyy").format(person.deathday!);
      deathdayText = deathdayText +
          " (${calcAge(person.birthday!, person.deathday!).year.toString()} anos)";
    } else {
      birthdayText =
          birthdayText + " (${calcAge(person.birthday!).year.toString()} anos)";
    }

    bool show = person.birthday != null ||
        person.deathday != null ||
        person.placeOfBirth != null;

    return show
        ? Padding(
            padding: defaultHPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionDivider(),
                person.birthday != null
                    ? BaseInfo(title: "Nascimento", info: birthdayText)
                    : Container(),
                person.deathday != null
                    ? BaseInfo(title: "Morte", info: deathdayText)
                    : Container(),
                person.placeOfBirth != null
                    ? BaseInfo(
                        title: "Local de nascimento",
                        info: person.placeOfBirth!)
                    : Container(),
              ],
            ),
          )
        : Container();
  }

  Widget _buildOverviewSection(Person person) {
    return person.biography != null && person.biography!.isNotEmpty
        ? Padding(
            padding: defaultHPadding,
            child: Column(
              children: [
                const SectionDivider(),
                Text(person.biography!).body(),
              ],
            ),
          )
        : Container();
  }

  Widget _buildCastCrewSection(
      String title, List<CastCrewParticipation> casting) {
    List<Movie> movies = casting
        .map((c) => Movie(
              adult: c.adult ?? false,
              id: c.id,
              originalTitle: c.originalTitle,
              releaseDate: c.releaseDate,
              status: "",
              title: c.title,
              posterPath: c.posterPath,
            ))
        .toList();

    return casting.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionDivider(),
              Padding(
                padding: defaultHPadding,
                child: Text(title)
                    .body(style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
              TitlesList(titles: movies),
            ],
          )
        : Container();
  }
}
