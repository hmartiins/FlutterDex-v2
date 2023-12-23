import 'package:flutter/material.dart';
import 'package:flutterdex/common/models/pokemon.dart';
import 'package:flutterdex/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:flutterdex/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.list,
      required this.pokemon,
      required this.onBack,
      required this.controller,
      required this.onChangePokemon});

  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        DetailAppBarWidget(pokemon: pokemon, onBack: onBack),
        DetailListWidget(
          pokemon: pokemon,
          list: list,
          controller: controller,
          onChangePokemon: onChangePokemon,
        )
      ],
    ));
  }
}
