import 'package:flutter/material.dart';
import 'package:flutterdex/common/error/failure.dart';
import 'package:flutterdex/common/models/pokemon.dart';
import 'package:flutterdex/common/repositories/pokemon_respository.dart';
import 'package:flutterdex/common/widgets/po_error.dart';
import 'package:flutterdex/common/widgets/po_loading.dart';
import 'package:flutterdex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutterdex/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {super.key, required this.repository, required this.onItemTap});
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data!,
            onItemTap: onItemTap,
          );
        }

        if (snapshot.hasError) {
          return PoError(error: (snapshot.error as Failure).message!);
        }

        return const PoLoading();
      },
    );
  }
}
