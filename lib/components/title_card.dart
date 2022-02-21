import 'package:flutter/material.dart';
import 'package:my_movies/models/imdb_title.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/size_config.dart';

class TitleCard extends StatelessWidget {
  TitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final IMDBTitle title;
  final double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2.0),
      child: SizedBox(
        width: defaultSize * 20.5,
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Container(
            color: kBlackColor,
            child: Text(
              title.title!,
              style: const TextStyle(color: kGrayColor),
            ),
          ),
        ),
      ),
    );
  }
}
