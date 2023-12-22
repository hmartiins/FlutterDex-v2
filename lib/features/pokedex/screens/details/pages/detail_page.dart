import 'package:flutter/material.dart';
import 'package:flutterdex/common/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.list, required this.pokemon});
  final Pokemon pokemon;
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: list
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.name),
                        ))
                    .toList(),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
