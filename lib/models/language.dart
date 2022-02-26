class Language {
  Language({required this.iso_639_1, required this.name, this.englishName});

  String iso_639_1;
  String name;
  String? englishName;

  factory Language.fromJson(Map<String, dynamic> data) {
    return Language(
      iso_639_1: data["iso_639_1"],
      name: data["name"],
      englishName:
          data.containsKey("english_name") ? data["english_name"] : null,
    );
  }
}

class LanguageCode {
  static const String pt_BR = "pt-BR";
  static const String en_US = "en-US";
}
