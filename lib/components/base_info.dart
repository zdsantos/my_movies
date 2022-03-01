import 'package:flutter/material.dart';
import 'package:my_movies/utils/styles.dart';

class BaseInfo extends StatelessWidget {
  const BaseInfo({Key? key, required this.title, required this.info})
      : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "$title: ",
        style: StyledTexts.bodyStyle().copyWith(fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: info,
            style:
                StyledTexts.bodyStyle().copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
