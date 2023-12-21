import 'package:flutter/material.dart';
import 'package:flutterdex/common/repositories/pokemon_respository.dart';
import 'package:flutterdex/features/home/container/home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterdex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: HomeContainer(
        repository: PokemonRepository(),
      ),
    );
  }
}
