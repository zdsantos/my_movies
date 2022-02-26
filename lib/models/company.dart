class Company {
  Company(
      {this.name = "",
      required this.id,
      this.logoPath,
      required this.originCountry});

  String name;
  int id;
  String? logoPath;
  String originCountry;

  factory Company.fromJson(Map<String, dynamic> data) {
    return Company(
      name: data["name"],
      id: data["id"] as int,
      originCountry: data["origin_country"],
      logoPath: data.containsKey("logo_path") ? data["logo_path"] : "",
    );
  }
}
