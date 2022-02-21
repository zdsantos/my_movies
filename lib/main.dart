import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movies/screens/design_system_exemples.dart';
import 'package:my_movies/screens/home_screen.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Movies',
        theme: ThemeData(
          scaffoldBackgroundColor: kWhiteColor,
          textTheme: GoogleFonts.interTextTheme()
              .apply(displayColor: kWhiteColor, bodyColor: kWhiteColor),
          primarySwatch: toMaterialColor(kBlackColor),
          appBarTheme: const AppBarTheme(
            backgroundColor: kWhiteColor,
            actionsIconTheme: IconThemeData(color: kSecondaryColor),
            iconTheme: IconThemeData(color: kSecondaryColor),
          ),
        ),
        // home: const HomeScreen(),
        home: const DesignSystemExamplesSreen());
  }
}
