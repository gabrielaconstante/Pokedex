import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokemonGrid extends StatefulWidget {
  const PokemonGrid({required this.pokemonList, super.key});
  final List<Pokemon> pokemonList;
  @override
  State<PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  int _getCrossAxisCount(double width) {
    if (width > 1000) {
      return 5;
    }
    if (width > 700) {
      return 4;
    }
    if (width > 450) {
      return 3;
    }
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    var pokemonList = widget.pokemonList;
    var width = MediaQuery.of(context).size.width;
    return GridView.count(
      padding: const EdgeInsets.all(7),
      crossAxisCount: _getCrossAxisCount(width),
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      semanticChildCount: pokemonList.length,
      childAspectRatio: 200 / 244,
      physics: const BouncingScrollPhysics(),
      children: pokemonList
          .map(
            (pokemon) => PokemonCard(pokemon: pokemon),
          )
          .toList(),
    );
  }
}
