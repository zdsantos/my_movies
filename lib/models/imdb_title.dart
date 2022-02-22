import 'package:my_movies/models/cast_member.dart';

class IMDBTitle {
  String id;
  String? title;
  String? titleType;
  int? year;
  String? imageUrl;
  int? runningTimeInMinutes;
  List<CastMember> principals;

  IMDBTitle({
    required this.id,
    required this.title,
    required this.titleType,
    required this.year,
    this.imageUrl,
    required this.runningTimeInMinutes,
    required this.principals,
  });

  factory IMDBTitle.fromJson(Map<String, dynamic> json) {
    List<CastMember> principals = json.containsKey('principals')
        ? (json['principals'] as List<dynamic>)
            .map((p) => CastMember.fromJson(p))
            .toList()
        : [];

    return IMDBTitle(
      id: json['id'],
      title: json['title'],
      titleType: json['titleType'],
      year: json.containsKey('year') ? (json['year'] as int) : null,
      imageUrl: json['image']?['url'],
      runningTimeInMinutes: json.containsKey('runningTimeInMinutes')
          ? (json['runningTimeInMinutes'] as int)
          : null,
      principals: principals,
    );
  }

  static List<IMDBTitle> mocList = <IMDBTitle>[
    IMDBTitle(
      id: "",
      title: "Avengers Ultimato",
      titleType: "movie",
      year: 2015,
      imageUrl:
          "https://br.web.img3.acsta.net/pictures/19/04/26/17/30/2428965.jpg",
      runningTimeInMinutes: 150,
      principals: [],
    ),
    IMDBTitle(
      id: "",
      title: "The Shawshank Redemption",
      titleType: "movie",
      year: 2015,
      imageUrl:
          "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/9964546b0ba1f6e14a6045e34b341f8ca2a3569752c5afed95b89682fcde1a68._RI_V_TTW_.jpg",
      runningTimeInMinutes: 150,
      principals: [],
    ),
    IMDBTitle(
      id: "",
      title: "The Lord of the Rings: The Two Towers",
      titleType: "movie",
      year: 2015,
      imageUrl:
          "https://www.oficialhostgeek.com.br/wp-content/uploads/2020/12/zzzz-scaled.jpg",
      runningTimeInMinutes: 150,
      principals: [],
    ),
    IMDBTitle(
      id: "",
      title: "Avengers Ultimato",
      titleType: "movie",
      year: 2015,
      imageUrl:
          "https://br.web.img3.acsta.net/pictures/19/04/26/17/30/2428965.jpg",
      runningTimeInMinutes: 150,
      principals: [],
    ),
    IMDBTitle(
      id: "",
      title: "The Shawshank Redemption",
      titleType: "movie",
      year: 2015,
      imageUrl:
          "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/9964546b0ba1f6e14a6045e34b341f8ca2a3569752c5afed95b89682fcde1a68._RI_V_TTW_.jpg",
      runningTimeInMinutes: 150,
      principals: [],
    ),
    IMDBTitle(
      id: "",
      title: "The Lord of the Rings: The Two Towers",
      titleType: "movie",
      year: 2015,
      imageUrl:
          "https://www.oficialhostgeek.com.br/wp-content/uploads/2020/12/zzzz-scaled.jpg",
      runningTimeInMinutes: 150,
      principals: [],
    ),
  ];
}
