import 'package:my_movies/models/role.dart';

class CastMember {
  final String id;
  final String? name;
  final String? legacyNameText;
  final String? imageUrl;
  final List<String> akas;
  final String? category;
  final List<String> characters;
  final List<Role> roles;

  CastMember({
    required this.id,
    required this.name,
    required this.legacyNameText,
    this.imageUrl,
    required this.akas,
    required this.category,
    required this.characters,
    required this.roles,
  });

  factory CastMember.fromJson(Map<String, dynamic> json) {
    List<Role> roles = json.containsKey('roles')
        ? (json['roles'] as List<dynamic>).map((r) => Role.fromJson(r)).toList()
        : [];
    List<String> akas = json.containsKey('akas')
        ? (json['akas'] as List<dynamic>).map((c) => c.toString()).toList()
        : [];
    List<String> characters = json.containsKey('characters')
        ? (json['characters'] as List<dynamic>)
            .map((c) => c.toString())
            .toList()
        : [];

    return CastMember(
      id: json['id'],
      name: json['name'],
      legacyNameText: json['legacyNameText'],
      imageUrl: json['image']?['url'],
      akas: akas,
      category: json['category'],
      characters: characters,
      roles: roles,
    );
  }

  // List<T> jsonListtoObject<T>(dynamic property) {
  //   return (property as List<dynamic>).map((e) => T.fromJson(e)).toList();
  // }
}
