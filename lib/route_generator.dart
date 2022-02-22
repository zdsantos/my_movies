import 'package:flutter/material.dart';
import 'package:my_movies/screens/design_system_exemples.dart';
import 'package:my_movies/screens/home_screen.dart';
import 'package:my_movies/utils/styles.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/design-system':
        return MaterialPageRoute(
            builder: (_) => const DesignSystemExamplesSreen());
      default:
        return _errorScreen();
    }
  }
}

Route<dynamic> _errorScreen() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      body: Center(
        child: const Text("Route error").h1(),
      ),
    );
  });
}
