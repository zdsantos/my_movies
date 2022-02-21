import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/size_config.dart';
import 'package:my_movies/utils/styles.dart';

class SolidIconButton extends StatelessWidget {
  final void Function() onTap;

  const SolidIconButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultSize = SizeConfig.defaultSize;

    return Container(
      width: defaultSize * 4,
      height: defaultSize * 4,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [boxShadow],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor,
          borderRadius: BorderRadius.circular(50),
          child: Icon(
            Icons.person,
            size: defaultSize * 3,
          ),
        ),
      ),
    );
  }
}
