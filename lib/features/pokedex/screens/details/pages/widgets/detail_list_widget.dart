import 'package:flutter/material.dart';
import 'package:flutterdex/common/models/pokemon.dart';

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
    return Positioned(
        top: 110,
        left: 0,
        right: 0,
        height: 350,
        child: Container(
          color: pokemon.baseColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: 200,
                width: double.infinity,
                child: PageView(
                    onPageChanged: (index) {
                      onChangePokemon(list[index]);
                    },
                    controller: controller,
                    children: list.map((e) {
                      bool diff = e.name != pokemon.name;
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: diff ? 0.4 : 1,
                        child: TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            tween: Tween<double>(
                                end: diff ? 150 : 300, begin: diff ? 300 : 150),
                            builder: (context, value, child) {
                              return Center(
                                child: Image.network(
                                  e.image,
                                  width: value,
                                  color: diff
                                      ? Colors.black.withOpacity(0.4)
                                      : null,
                                  fit: BoxFit.contain,
                                ),
                              );
                            }),
                      );
                    }).toList()),
              )
            ],
          ),
        ));
  }
}
