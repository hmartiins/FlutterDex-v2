import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdex/features/route.dart';
import 'package:flutterdex/common/repositories/pokemon_respository.dart';

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
      home: PokedexRoute(repository: PokemonRepository(dio: Dio())),
    );
  }
}
