import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final bool isPassword;
  final bool autofocus;

  const BoxTextField({
    Key? key,
    required this.controller,
    this.placeholder = "",
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.isPassword = false,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var circularBorder = OutlineInputBorder(
      borderRadius: roundedBorder,
      borderSide: BorderSide.none,
    );

    return TextField(
      autofocus: autofocus,
      controller: controller,
      style: GoogleFonts.inter().apply(color: kWhiteColor),
      cursorColor: kWhiteColor,
      cursorHeight: 22,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: EdgeInsets.symmetric(
            vertical: defaultPaddingSize / 2, horizontal: defaultPaddingSize),
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
