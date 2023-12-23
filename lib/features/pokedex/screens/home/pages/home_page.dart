import 'package:flutter/material.dart';
import 'package:flutterdex/common/models/pokemon.dart';
import 'package:flutterdex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:flutterdex/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.list, required this.onItemTap});
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              'Pokedex',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          centerTitle: false,
          elevation: 1,
          backgroundColor: Colors.red,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: list
                .map((e) => PokemonItemWidget(
                      pokemon: e,
                      index: list.indexOf(e),
                      onTap: onItemTap,
                    ))
                .toList(),
          ),
        ));
  }
}
