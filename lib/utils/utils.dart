import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';

String cleanId(String id) {
  return id.replaceAll('/title/', '').replaceAll('/', '');
}

MaterialColor toMaterialColor(Color color) {
  return MaterialColor(color.value, _getSwatch(color));
}

Map<int, Color> _getSwatch(Color color) {
  final hslColor = HSLColor.fromColor(color);
  final lightness = hslColor.lightness;

  /// if [500] is the default color, there are at LEAST five
  /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
  /// divisor of 5 would mean [50] is a lightness of 1.0 or
  /// a color of #ffffff. A value of six would be near white
  /// but not quite.
  const lowDivisor = 6;

  /// if [500] is the default color, there are at LEAST four
  /// steps above [500]. A divisor of 4 would mean [900] is
  /// a lightness of 0.0 or color of #000000
  const highDivisor = 5;

  final lowStep = (1.0 - lightness) / lowDivisor;
  final highStep = lightness / highDivisor;

  return {
    50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
    100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
    200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
    300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
    400: (hslColor.withLightness(lightness + lowStep)).toColor(),
    500: (hslColor.withLightness(lightness)).toColor(),
    600: (hslColor.withLightness(lightness - highStep)).toColor(),
    700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
    800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
    900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
  };
}

Widget defaultProgressIndicator() {
  return const Center(
    child: SizedBox(
      width: 40,
      child: LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader,
        colors: [kWhiteColor],
        strokeWidth: 2,
      ),
    ),
  );
}

double castDoubleFromJson(dynamic value) {
  return value is int ? value.toDouble() : value;
}

void showInfoSnakbar(BuildContext context, String text,
    {bool isError = false}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      backgroundColor: !isError
          ? kDarkColor.withOpacity(0.5)
          : kPrimaryLightColor.withOpacity(0.5),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: (!isError ? 2 : 3)),
      shape: const StadiumBorder(),
      margin: EdgeInsets.only(
          left: defaultMarginSize * 4,
          right: defaultMarginSize * 4,
          bottom: defaultMarginSize),
    ));
}
