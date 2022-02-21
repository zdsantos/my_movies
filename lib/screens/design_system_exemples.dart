import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';
import 'package:my_movies/utils/size_config.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/widgets/box_text.dart';
import 'package:my_movies/widgets/rounded_button.dart';
import 'package:my_movies/widgets/text_field.dart';

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
                  BoxText.heading1("Heading 1"),
                  vSpacer,
                  BoxText.heading2("Heading 2"),
                  vSpacer,
                  BoxText.heading3("Heading 3"),
                  vSpacer,
                  BoxText.subhead("Subhead"),
                  vSpacer,
                  BoxText.body(
                    "Body text",
                  ),
                  vSpacer,
                  const Divider(color: kGrayColor),
                  vSpacer,
                  BoxText.body(
                    "Button",
                  ),
                  vSpacerMin,
                  const RoundedButton(title: 'Button'),
                  vSpacer,
                  BoxText.body(
                    "Disabled button",
                  ),
                  vSpacerMin,
                  const RoundedButton(
                    title: 'Disable',
                    disable: true,
                  ),
                  vSpacer,
                  BoxText.body(
                    "Buzy button",
                  ),
                  vSpacerMin,
                  const RoundedButton(
                    title: 'Button',
                    buzy: true,
                  ),
                  vSpacer,
                  BoxText.body(
                    "Button with icon",
                  ),
                  vSpacerMin,
                  const RoundedButton(
                    title: 'Button',
                    leading: Icon(
                      Icons.person,
                      color: kWhiteColor,
                    ),
                  ),
                  vSpacer,
                  const Divider(color: kGrayColor),
                  vSpacer,
                  BoxText.body(
                    'Text field',
                  ),
                  vSpacerMin,
                  BoxTextField(
                    controller: TextEditingController(),
                  ),
                  vSpacer,
                  BoxText.body(
                    'Text field with trailing icon',
                  ),
                  vSpacerMin,
                  BoxTextField(
                    controller: TextEditingController(),
                    trailing: const Icon(
                      Icons.search,
                      color: kWhiteColor,
                    ),
                  ),
                  vSpacer,
                  BoxText.body(
                    'Text field with leading icon',
                  ),
                  vSpacerMin,
                  BoxTextField(
                    controller: TextEditingController(),
                    leading: const Icon(
                      Icons.person,
                      color: kWhiteColor,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
