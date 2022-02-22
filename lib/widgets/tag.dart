import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';

class Tag extends StatelessWidget {
  final String text;
  final ImageProvider<Object>? avatarImage;
  final void Function()? onPressed;

  const Tag({
    Key? key,
    required this.text,
    this.avatarImage,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputChip(
      elevation: 5,
      backgroundColor: kWhiteColor,
      onPressed: onPressed,
      avatar: avatarImage != null
          ? CircleAvatar(
              backgroundImage: avatarImage,
            )
          : null,
      label: Text(text).body(style: const TextStyle(color: kPrimaryColor)),
    );
  }
}
