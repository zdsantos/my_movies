class Role {
  final String? id;
  final String name;

  Role({
    this.id,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['characterId'],
      name: json['character'],
    );
  }
}
