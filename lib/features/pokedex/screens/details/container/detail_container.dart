import 'package:flutter/material.dart';
import 'package:flutterdex/common/error/failure.dart';
import 'package:flutterdex/common/models/pokemon.dart';
import 'package:flutterdex/common/repositories/pokemon_respository.dart';
import 'package:flutterdex/common/widgets/po_error.dart';
import 'package:flutterdex/common/widgets/po_loading.dart';
import 'package:flutterdex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments({this.index = 0, required this.pokemon});
  final Pokemon pokemon;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    super.key,
    required this.repository,
    required this.arguments,
    required this.onItemTap,
    required this.onBack,
  });

  final IPokemonRepository repository;
  final DetailArguments arguments;
  final Function(String) onItemTap;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late Future<List<Pokemon>> _future;
  late PageController _controller;
  Pokemon? _pokemon;

  @override
  void initState() {
    _controller = PageController(
        initialPage: widget.arguments.index!, viewportFraction: 0.55);
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if (_pokemon == null) {
            _pokemon = widget.arguments.pokemon;
          }

          return DetailPage(
            pokemon: _pokemon!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangePokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
          );
        }

        if (snapshot.hasError) {
          return PoError(error: (snapshot.error as Failure).message!);
        }

        return const PoLoading();
      },
    );
  }
}
