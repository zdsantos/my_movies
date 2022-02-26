class Country {
  Country({required this.name, required this.iso_3166_1});

  String name;
  String iso_3166_1;

  factory Country.fromJson(Map<String, dynamic> data) {
    return Country(
      name: data["name"],
      iso_3166_1: data["iso_3166_1"],
    );
  }
}
