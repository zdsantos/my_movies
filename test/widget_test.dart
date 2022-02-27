// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:my_movies/models/language.dart';
import 'package:my_movies/secrets.dart';
import 'package:my_movies/services/themoviedb_service.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  // test('Find titles', () async {
  //   IMDbService _service = IMDbService(xRapidApiKey, xRapidApiHost);

  //   var result = await _service.findTitles('avengers');
  //   expect(result.success, isTrue);
  //   expect(result.data, isNotNull);
  //   expect(result.data, isNotEmpty);
  //   expect(result.error, isNull);
  // });

  test('Get popular genres', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.fetchMoviesGenre();

    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });

  test('Get single movie', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.getMovie(550);

    expect(result.id, equals(550));
    expect(result.imdbId, equals("tt0137523"));
    expect(result.title, equals("Fight Club"));
    expect(result.status, equals("Released"));
    expect(result.genres.any((g) => g.id == 18), isTrue);
    expect(result.productionCompanies.any((c) => c.id == 508), isTrue);
    expect(result.productionCountries.any((c) => c.iso_3166_1 == "US"), isTrue);
    expect(result.spokenLanguages.any((c) => c.iso_639_1 == "en"), isTrue);
    expect(result.spokenLanguages.any((c) => c.iso_639_1 == "en"), isTrue);

    var resultPt = await service.getMovie(550, language: LanguageCode.pt_BR);

    expect(resultPt.id, equals(550));
    expect(resultPt.imdbId, equals("tt0137523"));
    expect(resultPt.title, equals("Clube da Luta"));
  });

  test('Get trending movies', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.fetchTrendingMovies();

    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });

  test('Get popular movies on BR', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.fetchPopularByRegion("BR");

    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });

  test('Get popular movies on BR pages', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result1 = await service.fetchPopularByRegion("BR", page: 1);

    expect(result1, isNotNull);
    expect(result1, isNotEmpty);

    var result2 = await service.fetchPopularByRegion("BR", page: 2);

    expect(result1, isNotNull);
    expect(result1, isNotEmpty);

    for (var item in result1) {
      var result = result2.every((element) => element.id != item.id);
      expect(result, isTrue);
    }
  });

  test('Get search movies by term', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.fetchMoviesByTerm("harry");

    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });

  test('Get movie credits', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.fetchMovieCredits(767);

    expect(result, isNotNull);
    expect(result.id, 767);
    expect(result.cast, isNotNull);
    expect(result.cast, isNotEmpty);
    expect(result.crew, isNotNull);
    expect(result.crew, isNotEmpty);
  });

  test('Get movie videos', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.fetchMovieVideos(767);

    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });

  test('Get upcoming movies on BR', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.fetchUpcomingMovies("BR");

    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });

  test('Get upcoming movies on BR pages', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result1 = await service.fetchUpcomingMovies("BR", page: 1);

    expect(result1, isNotNull);
    expect(result1, isNotEmpty);

    var result2 = await service.fetchUpcomingMovies("BR", page: 2);

    expect(result1, isNotNull);
    expect(result1, isNotEmpty);

    for (var item in result1) {
      var result = result2.every((element) => element.id != item.id);
      expect(result, isTrue);
    }
  });

  test('Get person', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.getPerson(10980);

    expect(result, isNotNull);
    expect(result.id, 10980);
    expect(result.name, "Daniel Radcliffe");
  });

  test('Get person credits', () async {
    TheMovieDBService service = TheMovieDBService(apiKey);

    var result = await service.fetchPersonCredits(10980);

    expect(result, isNotNull);
    expect(result.id, 10980);
    expect(result.cast, isNotNull);
    expect(result.cast, isNotEmpty);
    expect(result.crew, isNotNull);
    expect(result.crew, isNotEmpty);
  });
}
