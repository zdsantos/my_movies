import 'package:my_movies/utils/utils.dart';

class CastCrewMember {
  CastCrewMember({
    this.adult,
    this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    this.department,
    this.job,
  });

  bool? adult;
  int? gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String? character;
  String creditId;
  int? order;
  String? department;
  String? job;

  factory CastCrewMember.fromJson(Map<String, dynamic> data) {
    return CastCrewMember(
      adult: data.containsKey("adult") ? data["adult"] as bool : null,
      gender: data.containsKey("gender") && data["gender"] != null
          ? data["gender"] as int
          : null,
      id: data["id"] as int,
      knownForDepartment: data["known_for_department"],
      name: data["name"],
      originalName: data["original_name"],
      popularity: data.containsKey("popularity")
          ? castDoubleFromJson(data["popularity"])
          : 0.0,
      profilePath:
          data.containsKey("profile_path") ? data["profile_path"] : null,
      castId: data.containsKey("cast_id") && data["cast_id"] != null
          ? data["cast_id"] as int
          : null,
      character: data.containsKey("character") ? data["character"] : null,
      creditId: data["credit_id"],
      order: data.containsKey("order") && data["order"] != null
          ? data["order"] as int
          : null,
      department: data.containsKey("department") ? data["department"] : null,
      job: data.containsKey("job") ? data["job"] : null,
    );
  }
}
