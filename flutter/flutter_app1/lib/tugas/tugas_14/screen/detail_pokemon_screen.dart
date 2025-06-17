import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_14/api/get_pokemon.dart';

class DetailPokemonScreen extends StatefulWidget {
  final String name;
  const DetailPokemonScreen({super.key, required this.name});

  @override
  State<DetailPokemonScreen> createState() => _DetailPokemonScreenState();
}

class _DetailPokemonScreenState extends State<DetailPokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Pokemon List", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Expanded(
        child: FutureBuilder(
          future: GetPokemon().getDetailPokemon(widget.name),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final detail = snapshot.data;
              return Column(
                children: [
                  Image.network(detail!.sprites!.other!.officialArtwork!.frontDefault!),
                  Text(detail.name ?? ""),
                  for (int i = 0; i < 6; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text(detail.stats![i].stat!.name!), Text(detail.stats![i].baseStat.toString())],
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.grey.shade200,
                                        ),
                                        width: constraints.maxWidth,
                                        height: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color:
                                              detail.stats![i].baseStat! < 50
                                                  ? Colors.red
                                                  : detail.stats![i].baseStat! < 100
                                                  ? Colors.orange
                                                  : detail.stats![i].baseStat! < 120
                                                  ? Colors.yellow
                                                  : detail.stats![i].baseStat! < 170
                                                  ? Colors.green
                                                  : Colors.lightBlue,
                                        ),
                                        width: detail.stats![i].baseStat! / 200 * constraints.maxWidth,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            } else {
              return Text("Error : ${snapshot.error}");
            }
          },
        ),
      ),
    );
  }
}
