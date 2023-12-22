import 'package:flutter/material.dart';
import 'package:flutterdex/common/error/failure.dart';
import 'package:flutterdex/common/models/pokemon.dart';
import 'package:flutterdex/common/repositories/pokemon_respository.dart';
import 'package:flutterdex/common/widgets/po_error.dart';
import 'package:flutterdex/common/widgets/po_loading.dart';
import 'package:flutterdex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments({required this.pokemon});
  final Pokemon pokemon;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {super.key,
      required this.repository,
      required this.arguments,
      required this.onItemTap});

  final IPokemonRepository repository;
  final DetailArguments arguments;
  final Function(String) onItemTap;

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
          return DetailPage(pokemon: arguments.pokemon, list: snapshot.data!);
        }

        if (snapshot.hasError) {
          return PoError(error: (snapshot.error as Failure).message!);
        }

        return const PoLoading();
      },
    );
  }
}
