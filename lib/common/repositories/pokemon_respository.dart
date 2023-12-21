import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterdex/common/consts/consts_api.dart';
import 'package:flutterdex/common/error/failure.dart';
import 'package:flutterdex/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;

      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (err) {
      throw Failure(message: 'Error on getAllPokemons: $err');
    }
  }
}
