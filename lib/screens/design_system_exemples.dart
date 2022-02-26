import 'package:flutter/material.dart';
import 'package:my_movies/components/title_card.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/genre.dart';
import 'package:my_movies/models/movie.dart';
import 'package:my_movies/utils/my_movies_icons_icons.dart';
import 'package:my_movies/widgets/tag.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/widgets/rounded_button.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';
import 'package:my_movies/widgets/text_field.dart';

class DesignSystemExamplesSreen extends StatelessWidget {
  const DesignSystemExamplesSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: kBackgroundGradient,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  vSpacerSmall,
                  ...textExamples(),
                  vSpacerSmall,
                  const Divider(color: kGrayColor),
                  vSpacerSmall,
                  ...buttonExamples(),
                  vSpacerSmall,
                  const Divider(color: kGrayColor),
                  vSpacerSmall,
                  ...textFieldExamples(),
                  vSpacerSmall,
                  const Divider(color: kGrayColor),
                  vSpacerSmall,
                  ...componentsExamples(),
                  vSpacer,
                ],
              ),
            )),
      ),
    );
  }

  List<Widget> textExamples() {
    return [
      const Text("Textos").h2(),
      vSpacer,
      const Text("Heading 1").h1(),
      vSpacer,
      const Text("Heading 2").h2(),
      vSpacer,
      const Text("Heading 3").h3(),
      vSpacer,
      const Text("Subhead").subhead(),
      vSpacer,
      const Text("Body text").body(),
    ];
  }

  List<Widget> buttonExamples() {
    return [
      const Text("Botões").h2(),
      vSpacer,
      const Text("Button").body(),
      vSpacerMin,
      const RoundedButton(title: 'Button'),
      vSpacer,
      const Text("Disabled button").body(),
      vSpacerMin,
      const RoundedButton(
        title: 'Disable',
        disable: true,
      ),
      vSpacer,
      const Text("Buzy button").body(),
      vSpacerMin,
      const RoundedButton(
        title: 'Button',
        buzy: true,
      ),
      vSpacer,
      const Text("Button with icon").body(),
      vSpacerMin,
      const RoundedButton(
        title: 'Button',
        leading: Icon(
          Icons.person,
          color: kWhiteColor,
        ),
      ),
    ];
  }

  List<Widget> textFieldExamples() {
    return [
      const Text("Campos de texto").h2(),
      vSpacer,
      const Text('Text field').body(),
      vSpacerMin,
      BoxTextField(
        controller: TextEditingController(),
      ),
      vSpacer,
      const Text('Text field with trailing icon').body(),
      vSpacerMin,
      BoxTextField(
        controller: TextEditingController(),
        trailing: const Icon(
          Icons.search,
          color: kWhiteColor,
        ),
      ),
      vSpacer,
      const Text('Text field with leading icon').body(),
      vSpacerMin,
      BoxTextField(
        controller: TextEditingController(),
        leading: const Icon(
          Icons.person,
          color: kWhiteColor,
        ),
      ),
    ];
  }

  List<Widget> componentsExamples() {
    return [
      const Text("Componentes").h2(),
      vSpacer,
      const Text('Tags'),
      vSpacerMin,
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            Tag(text: "Action", onPressed: () {}),
            hSpacerSmall,
            Tag(text: "Adventure", onPressed: () {}),
            hSpacerSmall,
            Tag(text: "Comedy", onPressed: () {}),
            hSpacerSmall,
            Tag(text: "Documentary", onPressed: () {}),
            hSpacerSmall,
            Tag(text: "Historical", onPressed: () {}),
            hSpacerSmall,
            Tag(text: "Triller", onPressed: () {}),
          ],
        ),
      ),
      vSpacer,
      const Text('Tag with avatar image'),
      vSpacerMin,
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10,
          children: [
            Tag(
              text: "Robert Downey Jr.",
              avatarImage: const NetworkImage(
                  "http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ1k-ZKUe_s6cK7TnwlXGbThAFV-f1XPHTMoriO4Hbq0nhP3_fO3mcikmWF72sw"),
              onPressed: () {},
            ),
            Tag(
              text: "Chris Hemsworth",
              avatarImage: const NetworkImage(
                  "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcROzEC-B7v1i8RRS5Od8uqmvQoyYF68eKXML8JC2XKcLAUWtxeodclZYHDcdxJj"),
              onPressed: () {},
            ),
            Tag(
              text: "Mark Ruffalo",
              avatarImage: const NetworkImage(
                  "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQ5qqcxOlPUA5d7cYFebEx4dhObq1_MY9igDr825CiUi-9tvTD_hth40TAw5k9x"),
              onPressed: () {},
            ),
          ],
        ),
      ),
      vSpacer,
      const Text('Solid icon button').body(),
      vSpacerMin,
      SolidIconButton(icon: MyMoviesIcons.person, onTap: () {}),
      vSpacer,
      const Text("Card").body(),
      vSpacerMin,
      TitleCard(
        title: titleList[0],
      ),
      vSpacer,
      const Text("Card list").body(),
      vSpacerMin,
      TitlesList(
        titles: titleList,
      ),
      vSpacer,
      const Text("Card list in vertical").body(),
      vSpacerMin,
      TitlesList(
        titles: titleList,
        orientation: Axis.vertical,
      )
    ];
  }
}

var titleList = [
  Movie(
    adult: false,
    id: 634649,
    originalTitle: "Spider-Man: No Way Home",
    releaseDate: DateTime.parse("2021-12-15"),
    status: "Released",
    title: "Spider-Man: No Way Home",
    posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
    popularity: 6575.499,
    genres: [
      const Genre(id: 28, name: "Action"),
      const Genre(id: 12, name: "Adventure"),
      const Genre(id: 878, name: "Science Fiction"),
    ],
    backdropPath: "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
    overview:
        "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
    runtime: 148,
    voteAverage: 8.3,
    voteCount: 8296,
  ),
];
