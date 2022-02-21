import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/size_config.dart';
import 'package:my_movies/utils/styles.dart';

class Tag extends StatelessWidget {
  final String text;
  final double defaultSize = SizeConfig.defaultSize;
  final bool isOutlined;
  final void Function()? onTap;

  Tag({
    Key? key,
    required this.text,
    this.isOutlined = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(100);

    return Container(
      height: defaultSize * 3.5,
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      decoration: BoxDecoration(
        color: isOutlined ? Colors.transparent : null,
        gradient: !isOutlined ? kTagGradient : null,
        border: isOutlined ? Border.all(color: kPrimaryColor) : null,
        borderRadius: borderRadius,
        boxShadow: !isOutlined ? [boxShadow] : null,
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: kPrimaryColor,
        borderRadius: borderRadius,
        child: Text(
          text,
          style: const TextStyle(color: kWhiteColor),
        ),
      ),
    );
  }
}
