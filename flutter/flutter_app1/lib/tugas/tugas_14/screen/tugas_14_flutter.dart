import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_14/api/get_pokemon.dart';
import 'package:flutter_app1/tugas/tugas_14/models/all_pokemon_model.dart';
import 'package:flutter_app1/tugas/tugas_14/screen/detail_pokemon_screen.dart';

class TugasEmpatBelasFlutter extends StatefulWidget {
  static String id = "/tugas_14";
  const TugasEmpatBelasFlutter({super.key});

  @override
  State<TugasEmpatBelasFlutter> createState() => _TugasEmpatBelasFlutterState();
}

class _TugasEmpatBelasFlutterState extends State<TugasEmpatBelasFlutter> {
  late Future<List<Pokemon>> _pokemonList;
  List<Pokemon> _allPokemons = [];
  List<Pokemon> _filteredPokemons = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  void _loadPokemons() {
    _pokemonList = GetPokemon().getAllPokemon();
    _pokemonList.then((data) {
      setState(() {
        _allPokemons = data;
        _filteredPokemons = data;
      });
    });
  }

  void _refresh() {
    searchController.clear();
    _loadPokemons();
  }

  void _filterPokemons() {
    final filtered =
        _allPokemons
            .where((pokemon) => pokemon.name.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();

    setState(() {
      _filteredPokemons = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Pokemon List", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search pokemon...",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black.withAlpha(50), width: 1),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black.withAlpha(50), width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.redAccent.shade700, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.redAccent.shade700, width: 2.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 2.5),
                  ),
                ),
                controller: searchController,
                onChanged: (_) {
                  _filterPokemons();
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _pokemonList,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    if (_filteredPokemons.isEmpty) {
                      return Center(child: Text("No Pokemon"));
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        _refresh();
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filteredPokemons.length,
                        itemBuilder: (BuildContext context, int index) {
                          final pokemon = _filteredPokemons[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailPokemonScreen(name: pokemon.name)),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
                              height: 140,
                              margin: EdgeInsets.only(top: 16),
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        width: 120,
                                        fit: BoxFit.contain,
                                        imageUrl: pokemon.imageUrl,
                                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => Icon(Icons.image_not_supported_outlined),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4, left: 20, right: 8),
                                            child: Text(
                                              pokemon.name.toUpperCase(),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Text("Error: ${snapshot.error}");
                  }
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
