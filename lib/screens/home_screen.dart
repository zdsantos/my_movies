import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_movies/components/genres_list.dart';
import 'package:my_movies/components/text_title.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/api_result.dart';
import 'package:my_movies/models/genre.dart';
import 'package:my_movies/services/imdb_service.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/size_config.dart';
import 'package:my_movies/utils/utils.dart';

import '../secrets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    IMDbService _service = IMDbService(xRapidApiKey, xRapidApiHost);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu-hamburguer.svg",
              height: SizeConfig.defaultSize * 2),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: defaultSize * 2,
            ),
            // Search field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kGrayColor),
                child: TextField(
                  style: const TextStyle(color: kPrimaryColor),
                  cursorColor: kSecondaryColor,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: kPrimaryColor.withAlpha(150)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                ),
              ),
            ),
            SizedBox(
              height: defaultSize * 2,
            ),
            FutureBuilder<ApiResult<List<Genre>>>(
              future: _service.getGenres(),
              builder: (context, snapshot) => snapshot.hasData
                  ? GenresList(genres: snapshot.data!.data!)
                  : defaultProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2.0),
              child: const TitleText(
                title: "Populars",
              ),
            ),
            TitlesList(
                builder:
                    _service.getMoviesByGenre('/chart/popular/genre/action')),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2.0),
              child: const TitleText(
                title: "Populars",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
