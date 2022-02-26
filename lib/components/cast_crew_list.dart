import 'package:flutter/material.dart';
import 'package:my_movies/models/cast_crew_member.dart';
import 'package:my_movies/services/themoviedb_service.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/widgets/tag.dart';

class CastCrewList extends StatelessWidget {
  const CastCrewList({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<CastCrewMember> list;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {
                    Navigator.pushNamed(context, "/person", arguments: c.id);
                  },
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
