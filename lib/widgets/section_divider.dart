import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: defaultPaddingSize,
      endIndent: defaultPaddingSize,
      color: kPrimaryLightColor,
      height: defaultPaddingSize,
    );
  }
}
