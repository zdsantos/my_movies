import 'package:flutter/material.dart';
import 'package:my_movies/models/genre.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/size_config.dart';

class GenreTag extends StatelessWidget {
  GenreTag({
    Key? key,
    required this.genre,
  }) : super(key: key);

  final Genre genre;
  final double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(100);

    return Padding(
      padding: EdgeInsets.all(defaultSize * 0.5),
      child: InkWell(
        onTap: () {},
        borderRadius: borderRadius,
        hoverColor: kPrimaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2,
            vertical: defaultSize,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kPrimaryColor, kPrimaryLightColor],
            ),
            borderRadius: borderRadius,
          ),
          child: Text(
            genre.description,
            style: const TextStyle(color: kGrayColor),
          ),
        ),
      ),
    );
  }
}
