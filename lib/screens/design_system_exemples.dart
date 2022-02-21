import 'package:flutter/material.dart';
import 'package:my_movies/widgets/tag.dart';
import 'package:my_movies/models/genre.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/size_config.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/widgets/rounded_button.dart';
import 'package:my_movies/widgets/solid_icon_button.dart';
import 'package:my_movies/widgets/text_field.dart';
import 'package:my_movies/utils/extensions.dart';

class DesignSystemExamplesSreen extends StatelessWidget {
  const DesignSystemExamplesSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
        child: Row(children: [
          Tag(text: "Action", onTap: () {}, isOutlined: true),
          Tag(text: "Adventure", onTap: () {}),
          Tag(text: "Comedy", onTap: () {}),
          Tag(text: "Documentary", onTap: () {}),
          Tag(text: "Triller", onTap: () {}),
        ]),
      ),
      vSpacer,
      const Text('Solid icon button').body(),
      vSpacerMin,
      SolidIconButton(onTap: () {}),
    ];
  }
}
