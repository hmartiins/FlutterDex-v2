import 'package:flutter/material.dart';
import 'package:flutterdex/common/models/pokemon.dart';
import 'package:flutterdex/features/pokedex/screens/details/pages/widgets/detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {super.key,
      required this.pokemon,
      required this.list,
      required this.controller,
      required this.onChangePokemon});

  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('#${pokemon.num}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView(
                  onPageChanged: (index) {
                    onChangePokemon(list[index]);
                  },
                  controller: controller,
                  children: list.map((e) {
                    bool diff = e.name != pokemon.name;
                    return DetailItemListWidget(
                      isDiff: diff,
                      pokemon: e,
                    );
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
