import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/size_config.dart';
import 'package:my_movies/utils/styles.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final bool isPassword;

  const BoxTextField({
    Key? key,
    required this.controller,
    this.placeholder = "",
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    var circularBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide.none,
    );

    return TextField(
      controller: controller,
      style: bodyStyle.apply(color: kWhiteColor),
      cursorColor: kWhiteColor,
      cursorHeight: defaultSize * 1.6,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: EdgeInsets.symmetric(
            vertical: defaultSize, horizontal: defaultSize * 2),
        filled: true,
        fillColor: kPrimaryColor,
        border: circularBorder,
        focusedBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: kSecondaryDarkColor),
        ),
        prefixIcon: leading,
        suffixIcon: trailing != null
            ? GestureDetector(
                child: trailing,
                onTap: trailingTapped,
              )
            : null,
      ),
    );
  }
}
