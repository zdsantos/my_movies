import 'package:flutter/material.dart';

/// Texts Styles

extension StyledTexts on Text {
  Text h1({TextStyle? style}) {
    TextStyle defaultStyle = const TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text h2({TextStyle? style}) {
    TextStyle defaultStyle = const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text h3({TextStyle? style}) {
    TextStyle defaultStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text subhead({TextStyle? style}) {
    TextStyle defaultStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text body({TextStyle? style}) {
    TextStyle defaultStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  static TextStyle h1Style() => const Text("").h1().style!;
  static TextStyle h2Style() => const Text("").h2().style!;
  static TextStyle h3Style() => const Text("").h3().style!;
  static TextStyle bodyStyle() => const Text("").body().style!;
  static TextStyle subheadStyle() => const Text("").subhead().style!;
}

/// Shadow

BoxShadow boxShadow = const BoxShadow(
  color: Color(0x44000000),
  blurRadius: 4,
  offset: Offset(-1.5, 2.5),
);

/// Borders

BorderRadius roundedBorder = BorderRadius.circular(50);
BorderRadius defaultBorder = BorderRadius.circular(10);

/// Sizes and Spaces

const double _baseSize = 20.0;
const double defaultIconSize = 25.0;

Widget hSpacer = const SizedBox(width: _baseSize);
Widget hSpacerSmall = const SizedBox(width: _baseSize / 2);
Widget hSpacerMin = const SizedBox(width: _baseSize / 4);
Widget vSpacer = const SizedBox(height: _baseSize);
Widget vSpacerSmall = const SizedBox(height: _baseSize / 2);
Widget vSpacerMin = const SizedBox(height: _baseSize / 4);

double defaultPaddingSize = _baseSize;
double defaultMarginSize = _baseSize;

EdgeInsetsGeometry defaultHPadding =
    EdgeInsets.symmetric(horizontal: defaultPaddingSize);

EdgeInsetsGeometry defaultVPadding =
    EdgeInsets.symmetric(vertical: defaultPaddingSize);
