import 'package:flutter/material.dart';
import 'package:my_movies/utils/size_config.dart';

double defaultSize = SizeConfig.defaultSize;

/// Texts Styles

extension StyledTexts on Text {
  Text h1({TextStyle? style}) {
    TextStyle defaultStyle = TextStyle(
      fontSize: SizeConfig.defaultSize * 3.4,
      fontWeight: FontWeight.w400,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text h2({TextStyle? style}) {
    TextStyle defaultStyle = TextStyle(
      fontSize: defaultSize * 2.8,
      fontWeight: FontWeight.w600,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text h3({TextStyle? style}) {
    TextStyle defaultStyle = TextStyle(
      fontSize: defaultSize * 2.4,
      fontWeight: FontWeight.w600,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text subhead({TextStyle? style}) {
    TextStyle defaultStyle = TextStyle(
      fontSize: defaultSize * 2.0,
      fontWeight: FontWeight.w400,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text body({TextStyle? style}) {
    TextStyle defaultStyle = TextStyle(
      fontSize: defaultSize * 1.6,
      fontWeight: FontWeight.w400,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }
}

/// Spaces

Widget hSpacer = const SizedBox(width: 20);
Widget hSpacerSmall = const SizedBox(width: 10);
Widget hSpacerMin = const SizedBox(width: 5);
Widget vSpacer = const SizedBox(height: 20);
Widget vSpacerSmall = const SizedBox(height: 10);
Widget vSpacerMin = const SizedBox(height: 5);

/// Shadow

BoxShadow boxShadow = const BoxShadow(
  color: Color(0x44000000),
  blurRadius: 4,
  offset: Offset(-1.5, 2.5),
);
