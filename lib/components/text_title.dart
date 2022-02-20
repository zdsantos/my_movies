import 'package:flutter/material.dart';
import 'package:my_movies/utils/size_config.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: SizeConfig.defaultSize * 2.4,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
