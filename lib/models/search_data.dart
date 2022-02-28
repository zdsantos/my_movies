import 'dart:convert';

import 'package:my_movies/models/genre.dart';

class SearchData {
  SearchData({this.searchTerm, this.searchGenre})
      : assert((searchTerm != null && searchTerm.isNotEmpty) ||
            (searchGenre != null && searchGenre.name.isNotEmpty));

  String? searchTerm;
  Genre? searchGenre;

  factory SearchData.fromJson(Map<String, dynamic> data) {
    return SearchData(
      searchTerm: data.containsKey("searchTerm") ? data["searchTerm"] : null,
      searchGenre: data.containsKey("searchGenre")
          ? Genre.fromJson(json.decode(data["searchGenre"]))
          : null,
    );
  }
}
