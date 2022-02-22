import 'package:flutter/material.dart';
import 'package:my_movies/components/genres_list.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/api_result.dart';
import 'package:my_movies/models/genre/genre.dart';
import 'package:my_movies/models/imdb_title.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';
import 'package:my_movies/widgets/text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: kBackgroundGradient),
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: defaultHPadding,
                      child: BoxTextField(
                        controller: _searchController,
                        trailing: const Icon(
                          MyMoviesIcons.bookmark,
                          color: kWhiteColor,
                        ),
                        trailingTapped: () {},
                      ),
                    ),
                    // vSpacer,
                    // FutureBuilder<ApiResult<List<Genre>>>(
                    //   future: _service.getGenres(),
                    //   builder: ((context, snapshot) {
                    //     if (snapshot.connectionState ==
                    //         ConnectionState.waiting) {
                    //       return Center(child: defaultProgressIndicator());
                    //     } else {
                    //       if (snapshot.data!.success) {
                    //         return GenresList(genres: snapshot.data!.data!);
                    //       } else {
                    //         return Center(
                    //           child: Text(snapshot.data!.error!).body(
                    //             style: const TextStyle(color: Colors.red),
                    //           ),
                    //         );
                    //       }
                    //     }
                    //   }),
                    // ),
                    vSpacer,
                    Padding(
                      padding: defaultHPadding,
                      child: const Text("Popular").h1(),
                    ),
                    vSpacerSmall,
                    Center(
                      child: TitlesList(
                        titles: IMDBTitle.mocList,
                        orientation: Axis.vertical,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child:
                    SolidIconButton(icon: MyMoviesIcons.person, onTap: () {}),
                right: defaultPaddingSize,
                top: defaultPaddingSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
