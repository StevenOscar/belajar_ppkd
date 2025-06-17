// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AllPokemonModel {
  int count;
  String next;
  dynamic previous;
  List<Pokemon> results;

  AllPokemonModel({required this.count, required this.next, required this.previous, required this.results});

  factory AllPokemonModel.fromRawJson(String str) => AllPokemonModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllPokemonModel.fromJson(Map<String, dynamic> json) {
    return AllPokemonModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Pokemon {
  String name;
  String url;
  String imageUrl;

  Pokemon({required this.name, required this.url, required this.imageUrl});

  factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    String id = json["url"].split("/")[6];
    return Pokemon(
      name: json["name"],
      url: json["url"],
      imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png",
    );
  }
  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
