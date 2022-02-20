class Genre {
  final String description;
  final String endpoint;

  Genre({required this.description, required this.endpoint});

  factory Genre.fromJson(Map<String, dynamic> data) {
    return Genre(
      description: data['description'],
      endpoint: data['endpoint'],
    );
  }
}
