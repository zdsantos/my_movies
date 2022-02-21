import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const BoxText._(this.text, this.style);

  factory BoxText.heading1(String text) {
    return BoxText._(text, heading1Style.apply(color: kWhiteColor));
  }

  factory BoxText.heading2(String text) {
    return BoxText._(text, heading2Style.apply(color: kWhiteColor));
  }

  factory BoxText.heading3(String text) {
    return BoxText._(text, heading3Style.apply(color: kWhiteColor));
  }

  factory BoxText.body(String text, {Color? color = kWhiteColor}) {
    return BoxText._(text, bodyStyle.apply(color: color));
  }

  factory BoxText.subhead(String text, {Color? color = kWhiteColor}) {
    return BoxText._(text, subheadStyle.apply(color: color));
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
