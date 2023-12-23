import 'package:flutter/material.dart';
import 'package:flutterdex/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget(
      {super.key, required this.pokemon, required this.onBack});
  final Pokemon pokemon;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: () => {
          onBack(),
        },
      ),
    );
  }
}
