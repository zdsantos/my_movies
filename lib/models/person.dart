class Person {
  Person({
    required this.adult,
    required this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    required this.gender,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.knownForDepartment,
    required this.name,
    this.placeOfBirth,
    required this.popularity,
    this.profilePath,
  });

  bool adult;
  List<String> alsoKnownAs;
  String? biography;
  DateTime? birthday;
  DateTime? deathday;
  int gender;
  String? homepage;
  int id;
  String? imdbId;
  String knownForDepartment;
  String name;
  String? placeOfBirth;
  double popularity;
  String? profilePath;

  factory Person.fromJson(Map<String, dynamic> data) {
    List<String> alsoKnownAs = data.containsKey('also_known_as')
        ? (data['also_known_as'] as List<dynamic>)
            .map((n) => n.toString())
            .toList()
        : [];

    return Person(
      adult: data["adult"] as bool,
      alsoKnownAs: alsoKnownAs,
      biography: data["biography"],
      birthday: data.containsKey("birthday") && data["birthday"] != null
          ? DateTime.parse(data["birthday"])
          : null,
      deathday: data.containsKey("deathday") && data["deathday"] != null
          ? DateTime.parse(data["deathday"])
          : null,
      homepage: data.containsKey("homepage") ? data["homepage"] : null,
      imdbId: data.containsKey("imdb_id") ? data["imdb_id"] : null,
      gender: data["gender"],
      id: data["id"] as int,
      knownForDepartment: data["known_for_department"],
      name: data["name"],
      placeOfBirth:
          data.containsKey("place_of_birth") ? data["place_of_birth"] : null,
      popularity: data["popularity"],
      profilePath:
          data.containsKey("profile_path") ? data["profile_path"] : null,
    );
  }
}
