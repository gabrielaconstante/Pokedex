//id
//url
//name
//get image
//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png
// construtor com parametros nomeados

import 'dart:ffi';

import 'package:pokedex/utils/constants.dart';

class Pokemon {
  String name;
  String url;

  Pokemon({required this.name, required this.url});
  // ['https', , 'pokeapi.co', 'api', 'v2', 'pokemon', '1', ]
  get id {
    var urlParts = url.split('/');
    var id = urlParts.reversed.skip(1).first;
    return int.parse(id);
  }

  get image => '$pokemonImgUrl/$id.png';

  factory Pokemon.fromJson(Map<String, dynamic> jsonData) {
    return Pokemon(name: jsonData['name'], url: jsonData['url']);
  }
}
