import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_14/api/get_pokemon.dart';
import 'package:flutter_app1/tugas/tugas_14/models/all_pokemon_model.dart';
import 'package:flutter_app1/tugas/tugas_14/screen/detail_pokemon_screen.dart';
import 'package:flutter_app1/tugas/tugas_15/api/user_api.dart';
import 'package:flutter_app1/tugas/tugas_15/models/user_model.dart';
import 'package:flutter_app1/tugas/tugas_15/screens/profile_screen_15.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PokemonListScreen15 extends StatefulWidget {
  final User userData;
  static String id = "/tugas_14";
  const PokemonListScreen15({super.key, required this.userData});

  @override
  State<PokemonListScreen15> createState() => _PokemonListScreen15State();
}

class _PokemonListScreen15State extends State<PokemonListScreen15> {
  late Future<List<Pokemon>> _pokemonList;
  final FToast fToast = FToast();
  late User userData;
  List<Pokemon> _allPokemons = [];
  List<Pokemon> _filteredPokemons = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    userData = widget.userData;
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
            .where(
              (pokemon) => pokemon.name.toLowerCase().contains(searchController.text.toLowerCase()),
            )
            .toList();

    setState(() {
      _filteredPokemons = filtered;
    });
  }

  Future<void> reloadProfile() async {
    final updatedUser = await UserApi().getUserProfile();
    if (updatedUser.data != null && updatedUser.data!.user != null) {
      setState(() {
        userData = updatedUser.data!.user!;
      });
    } else {
      fToast.showToast(
        gravity: ToastGravity.TOP,
        toastDuration: Duration(seconds: 2),
        child: Container(
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Text("Failed to reload profile", style: TextStyle(color: Colors.white)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Pokemon List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          ProfileScreen15(userData: userData, reloadProfile: reloadProfile),
                ),
              );
            },
            child: Column(
              children: [Text(userData.name ?? "No name"), Text(userData.email ?? "No email")],
            ),
          ),
        ],
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
                                MaterialPageRoute(
                                  builder: (context) => DetailPokemonScreen(name: pokemon.name),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red,
                              ),
                              height: 140,
                              margin: EdgeInsets.only(top: 16),
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        width: 120,
                                        fit: BoxFit.contain,
                                        imageUrl: pokemon.imageUrl,
                                        placeholder:
                                            (context, url) =>
                                                Center(child: CircularProgressIndicator()),
                                        errorWidget:
                                            (context, url, error) =>
                                                Icon(Icons.image_not_supported_outlined),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 4,
                                              left: 20,
                                              right: 8,
                                            ),
                                            child: Text(
                                              pokemon.name.toUpperCase(),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                              ),
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
