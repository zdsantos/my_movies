import 'package:flutter/material.dart';
import 'package:my_movies/utils/size_config.dart';

double defaultSize = SizeConfig.defaultSize;

// Texts Styles

TextStyle heading1Style = TextStyle(
  fontSize: defaultSize * 3.4,
  fontWeight: FontWeight.w400,
);

TextStyle heading2Style = TextStyle(
  fontSize: defaultSize * 2.8,
  fontWeight: FontWeight.w600,
);

TextStyle heading3Style = TextStyle(
  fontSize: defaultSize * 2.4,
  fontWeight: FontWeight.w600,
);

TextStyle bodyStyle = TextStyle(
  fontSize: defaultSize * 1.6,
  fontWeight: FontWeight.w400,
);

TextStyle subheadStyle = TextStyle(
  fontSize: defaultSize * 2.0,
  fontWeight: FontWeight.w400,
);

// Spaces

Widget hSpacer = const SizedBox(width: 20);
Widget hSpacerSmall = const SizedBox(width: 10);
Widget hSpacerMin = const SizedBox(width: 5);
Widget vSpacer = const SizedBox(height: 20);
Widget vSpacerSmall = const SizedBox(height: 10);
Widget vSpacerMin = const SizedBox(height: 5);
