import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';

class SolidIconButton extends StatelessWidget {
  const SolidIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: roundedBorder,
        boxShadow: [boxShadow],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: roundedBorder,
          child: Icon(
            icon,
            size: defaultIconSize,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
