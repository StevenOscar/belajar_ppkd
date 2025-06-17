import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_14/api/get_pokemon.dart';
import 'package:flutter_app1/tugas/tugas_14/screen/detail_pokemon_screen.dart';

class TugasEmpatBelasFlutter extends StatefulWidget {
  static String id = "/tugas_14";
  const TugasEmpatBelasFlutter({super.key});

  @override
  State<TugasEmpatBelasFlutter> createState() => _TugasEmpatBelasFlutterState();
}

class _TugasEmpatBelasFlutterState extends State<TugasEmpatBelasFlutter> {
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
            TextField(decoration: InputDecoration(hintText: "")),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: GetPokemon().getAllPokemon(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        final pokemon = snapshot.data?[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPokemonScreen(name: pokemon.name,),));
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
                            height: 200,
                            margin: EdgeInsets.only(top: 16),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.fitWidth,
                                    imageUrl: pokemon!.imageUrl,
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => Icon(Icons.image_not_supported_outlined),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          pokemon.name.toUpperCase(),
                                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text("Error : ${snapshot.error}");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
