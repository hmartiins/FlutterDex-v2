import 'package:flutter/material.dart';
import 'package:flutterdex/common/repositories/pokemon_respository.dart';
import 'package:flutterdex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutterdex/features/pokedex/screens/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({super.key, required this.repository});
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            });
          case '/details':
            return MaterialPageRoute(builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments) as DetailArguments,
                onItemTap: (String) {},
              );
            });
          default:
            return null;
        }
      },
    );
  }
}
