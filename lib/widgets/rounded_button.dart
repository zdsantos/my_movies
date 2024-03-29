import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final bool disable;
  final bool buzy;
  final Widget? leading;
  final void Function()? onTap;

  const RoundedButton({
    Key? key,
    required this.title,
    this.disable = false,
    this.buzy = false,
    this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: !disable ? kDarkColor : kGrayColor,
          borderRadius: roundedBorder,
        ),
        child: !buzy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) hSpacerMin,
                  Text(title).body(),
                ],
              )
            : const CircularProgressIndicator(color: kWhiteColor),
      ),
    );
  }
}
