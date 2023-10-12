import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/api.dart';
import 'package:pokedex/utils/constants.dart';

class PokeAPI {
  static Pokemon getPokemon(Map<String, dynamic> pokeonData) {
    return Pokemon.fromJson(pokeonData);
  }

  static Future<List<Pokemon>> getPokemonList({int? limit, int? offset}) async {
    limit ??= 150;
    offset ??= 0;

    final jsonData =
        await Api.getData('$pokeApiUrl?limit=$limit&offset=$offset');

    List<Pokemon> pokemonList = [];
    for (var item in jsonData['results']) {
      final pokemon = getPokemon(item);
      pokemonList.add(pokemon);
    }

    return pokemonList;
  }
}
