import 'package:flutter/material.dart';
import 'package:my_movies/models/imdb_title.dart';
import 'package:my_movies/utils/styles.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({Key? key, required this.title, this.onTap})
      : super(key: key);

  final IMDBTitle title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: AspectRatio(
          aspectRatio: 0.675,
          child: Stack(
            children: [
              Positioned.fill(
                bottom: 0.0,
                child: ClipRRect(
                  borderRadius: defaultBorder,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [boxShadow],
                    ),
                    child: Image(
                      image: NetworkImage(title.imageUrl ??
                          "https://colegioeducador.com.br/wp-content/uploads/2019/04/placeholder-image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                  bottom: 0.0,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: defaultBorder,
                      onTap: () {},
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
