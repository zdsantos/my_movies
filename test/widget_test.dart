// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:my_movies/services/imdb_Service.dart';

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

  test('Find titles', () async {
    IMDbService _service = IMDbService(
      "fc2bb2c207msh9ff806ba65db2f1p1cbd50jsn04509e238894",
      "imdb8.p.rapidapi.com",
    );

    var result = await _service.findTitles('avengers');
    expect(result.success, isTrue);
    expect(result.data, isNotNull);
    expect(result.data, isNotEmpty);
    expect(result.error, isNull);
  });

  test('Get popular genres', () async {
    IMDbService _service = IMDbService(
      "fc2bb2c207msh9ff806ba65db2f1p1cbd50jsn04509e238894",
      "imdb8.p.rapidapi.com",
    );

    var result = await _service.getGenres();
    expect(result.success, isTrue);
    expect(result.data, isNotNull);
    expect(result.data, isNotEmpty);
    expect(result.error, isNull);
  });

  test('Get single title', () async {
    IMDbService _service = IMDbService(
      "fc2bb2c207msh9ff806ba65db2f1p1cbd50jsn04509e238894",
      "imdb8.p.rapidapi.com",
    );

    String id = "/title/tt0848228/";

    var result = await _service.getTitle(id);

    expect(result.success, isTrue);
    expect(result.data, isNotNull);
    expect(result.error, isNull);

    expect(result.data?.id, equals(id));
    expect(result.data?.title, equals("The Avengers"));
    expect(result.data?.titleType, equals("movie"));
  });

  // test('Get title by genre', () async {
  //   IMDbService _service = IMDbService(
  //     "fc2bb2c207msh9ff806ba65db2f1p1cbd50jsn04509e238894",
  //     "imdb8.p.rapidapi.com",
  //   );

  //   String genreEndpoint = '/chart/popular/genre/action';

  //   var result = _service.getMoviesByGenre(genreEndpoint);

  //   expect(result.success, isTrue);
  //   expect(result.data, isNotNull);
  //   expect(result.error, isNull);

  //   result.data!.listen((title) {
  //     expect(title, isNotNull);
  //     expect(title.id, isNotNull);
  //     expect(title.id, isNotEmpty);
  //     count++;
  //   }, onDone: () {
  //     expect(true, isTrue);
  //     expect(count, equals(20));
  //   }, onError: (e) {
  //     print(e);
  //     expect(e, isNull);
  //   }, cancelOnError: true);
  // });
}
