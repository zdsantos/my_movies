import 'package:flutter/material.dart';
import 'package:my_movies/components/title_card.dart';
import 'package:my_movies/components/titles_list.dart';
import 'package:my_movies/models/imdb_title.dart';
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
        title: IMDBTitle(
          id: "",
          title: "Avengers Ultimato",
          titleType: "movie",
          year: 2015,
          imageUrl:
              "https://br.web.img3.acsta.net/pictures/19/04/26/17/30/2428965.jpg",
          runningTimeInMinutes: 150,
          principals: [],
        ),
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
