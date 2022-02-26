import 'package:flutter/material.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/widgets/base_container.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Center(
        child: Text(id.toString()).error(),
      ),
    );
  }
}
