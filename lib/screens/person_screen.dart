import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_movies/providers/person_provider.dart';
import 'package:my_movies/providers/provider_state.dart';
import 'package:my_movies/utils/styles.dart';
import 'package:my_movies/utils/utils.dart';
import 'package:my_movies/widgets/base_container.dart';
import 'package:provider/provider.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<PersonProvider>(
            create: (context) => PersonProvider(id)),
      ],
      child: BaseContainer(
        height: double.infinity,
        child: Builder(
          builder: (context) {
            var provider = Provider.of<PersonProvider>(context);

            switch (provider.state) {
              case ProviderState.success:
                return _buildPersonView(provider);
              case ProviderState.error:
                return Center(
                  child: const Text(
                          "Ocorreu um erro ao buscar informações do título")
                      .error(),
                );
              case ProviderState.initial:
              case ProviderState.loading:
              default:
                return Center(
                  child: defaultProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildPersonView(PersonProvider provider) {
    return Center(
      child: Column(
        children: [
          Text(provider.person.name).body(),
          Text(DateFormat("dd/MM/yyyy").format(provider.person.birthday!))
              .body(),
          Text(calcAge(provider.person.birthday!).year.toString()).body(),
          Text("Atuou em ${provider.credits.cast.length.toString()}").body(),
          Text("Participou de ${provider.credits.crew.length.toString()}")
              .body(),
        ],
      ),
    );
  }
}
