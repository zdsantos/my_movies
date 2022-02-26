import 'package:flutter/material.dart';

/// Colors

const kPrimaryColor = Color(0xFF621F7A);
const kPrimaryLightColor = Color(0xFF9744B5);
const kPrimaryDarkColor = Color(0xFF411551);
const kSecondaryColor = Color(0xFF0A81D1);
const kSecondaryLightColor = Color(0xFF24A1F5);
const kSecondaryDarkColor = Color(0xFF0869AA);
const kWhiteColor = Color(0xFFE8E8E8);
const kGrayColor = Color(0xFFBEA1C9);
const kDarkColor = Color(0xFF290D33);
const kBlackColor = Color(0xFF222222);
const kErrorColor = Color(0xFFE96868);

/// Gradients

var kTagGradient = const LinearGradient(
  colors: [
    kPrimaryColor,
    kPrimaryLightColor,
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

var kBackgroundGradient = const LinearGradient(
  colors: [
    kPrimaryDarkColor,
    kPrimaryLightColor,
  ],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
);
