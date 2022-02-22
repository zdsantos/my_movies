import 'package:flutter/material.dart';
import 'package:my_movies/services/imdb_service.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';
import 'package:my_movies/widgets/text_field.dart';

import '../secrets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IMDbService _service = IMDbService(xRapidApiKey, xRapidApiHost);
    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          SolidIconButton(icon: MyMoviesIcons.person, onTap: () {}),
          // SvgPicture.asset("assets/icons/person.svg", height: 20)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          vSpacer,
          BoxTextField(
            controller: _searchController,
          ),
        ],
      ),
    );
  }
}
