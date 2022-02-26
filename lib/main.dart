import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_movies/route_generator.dart';
import 'package:my_movies/secrets.dart';
import 'package:my_movies/services/themoviedb_service.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/utils.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting();

  setupDepedencies();
  runApp(const MyApp());
}

void setupDepedencies() {
  GetIt.I.registerSingleton(TheMovieDBService(apiKey));
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
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
