import 'dart:convert';

import 'package:flutter_app1/tugas/tugas_14/models/all_pokemon_model.dart';
import 'package:flutter_app1/tugas/tugas_14/models/pokemon_detail_model.dart';
import 'package:http/http.dart' as http;

class GetPokemon {
  Future<int> getTotalPokemon() async {
    final response = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));

    if (response.statusCode == 200) {
      AllPokemonModel responseModel = AllPokemonModel.fromJson(json.decode(response.body));
      return responseModel.count;
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<List<Pokemon>> getAllPokemon() async {
    final int limit = await getTotalPokemon();
    final response = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=$limit"));

    if (response.statusCode == 200) {
      final List<dynamic> pokemonJson = json.decode(response.body)["results"];
      return pokemonJson.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<PokemonDetailModel> getDetailPokemon(String name) async {
    final response = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$name"));
    if (response.statusCode == 200) {
      final dynamic pokemonJson = json.decode(response.body);
      print("test: ${PokemonDetailModel.fromJson(pokemonJson).sprites!.other!.officialArtwork!.frontDefault}");
      return PokemonDetailModel.fromJson(pokemonJson);
    } else {
      throw Exception("Failed to load users");
    }
  }
}
