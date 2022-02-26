import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';

class Tag extends StatelessWidget {
  Tag({
    Key? key,
    required this.text,
    this.info,
    this.avatarImage,
    this.onPressed,
  }) : super(key: key);

  final String text;
  String? info;
  final ImageProvider<Object>? avatarImage;
  final void Function()? onPressed;

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
      label: info != null
          ? Column(
              children: [
                Text(text).body(style: const TextStyle(color: kPrimaryColor)),
                Text(info!).body(
                    style: const TextStyle(fontSize: 14, color: kGrayColor))
              ],
            )
          : Text(text).body(style: const TextStyle(color: kPrimaryColor)),
    );
  }
}
