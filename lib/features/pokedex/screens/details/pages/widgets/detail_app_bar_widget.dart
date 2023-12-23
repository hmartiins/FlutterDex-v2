import 'package:flutter/material.dart';
import 'package:flutterdex/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget(
      {super.key,
      required this.pokemon,
      required this.onBack,
      required this.isOnTop});

  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
        onPressed: () => {
          onBack(),
        },
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isOnTop ? 0 : 1,
        child: Text(
          pokemon.name,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
