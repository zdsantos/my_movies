import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  const Genre({required this.id, required this.name});

  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> data) {
    return Genre(
      id: data['id'] as int,
      name: data['name'],
    );
  }

  @override
  List<Object> get props => [id, name];

  static List<Genre> mocList = const [
    Genre(id: 0, name: "Action"),
    Genre(id: 0, name: "Adventure"),
    Genre(id: 0, name: "Comedy"),
    Genre(id: 0, name: "Documentary"),
    Genre(id: 0, name: "Historical"),
    Genre(id: 0, name: "Triller"),
  ];
}
