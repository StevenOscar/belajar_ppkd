import 'package:cached_network_image/cached_network_image.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.name.toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: GetPokemon().getDetailPokemon(widget.name),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final detail = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.contain,
                      imageUrl: detail!.sprites!.other!.officialArtwork!.frontDefault!,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                  Text(
                    detail.name.toString().toUpperCase(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < detail.types!.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                          child: Image.asset("assets/images/tugas_14/${detail.types![i].type!.name}.png", scale: 0.7),
                        ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 2), borderRadius: BorderRadius.circular(24)),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Text("ABILITY", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.red)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < detail.abilities!.length; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                  children: [
                                    Chip(
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                                      label: Text(
                                        detail.abilities![i].ability!.name!.toUpperCase().replaceAll("-", " "),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 2), borderRadius: BorderRadius.circular(24)),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Text("STATS", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.red)),
                        SizedBox(height: 12),
                        for (int i = 0; i < 6; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 11,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        detail.stats![i].stat!.name!.toUpperCase().replaceAll("-", " "),
                                        style: TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        detail.stats![i].baseStat.toString(),
                                        style: TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 12,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(24),
                                                color: Colors.grey.shade300,
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
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  detail.moves!.isEmpty
                      ? Text(
                        "No Moves",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
                      )
                      : Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Text(
                              "MOVES",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.red),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Move Name",
                                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Learned By",
                                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            for (int i = 0; i < detail.moves!.length; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      detail.moves![i].move!.name!.capitalize().replaceAll("-", " "),
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      detail.moves![i].versionGroupDetails!.last.moveLearnMethod!.name
                                          .toString()
                                          .capitalize()
                                          .replaceAll("-", " "),
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                  SizedBox(height: 48),
                ],
              ),
            );
          } else {
            return Text("Error : ${snapshot.error}");
          }
        },
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
