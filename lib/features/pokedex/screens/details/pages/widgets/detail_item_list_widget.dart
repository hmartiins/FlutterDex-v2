import 'package:flutter/material.dart';
import 'package:flutterdex/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {super.key, required this.isDiff, required this.pokemon});
  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isDiff ? 0.4 : 1,
        child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            tween: Tween<double>(
                end: isDiff ? 150 : 300, begin: isDiff ? 300 : 150),
            builder: (context, value, child) {
              return Image.network(
                pokemon.image,
                width: value,
                color: isDiff ? Colors.black.withOpacity(0.4) : null,
                fit: BoxFit.contain,
              );
            }),
      ),
    );
  }
}
