import 'package:flutter/material.dart';

class TugasSatuFlutter extends StatelessWidget {
  const TugasSatuFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Profil Saya", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
              border: Border.all(color: Colors.black, width: 2)
            ),
            child: Column(
              children: [
                Text(
                  "Steven Oscar",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 10,),
                    Text(
                      "Bekasi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
              border: Border.all(color: Colors.black, width: 2)
            ),
            child: Text(
              "I am a fresh graduate of Esa Unggul University majoring in Informatics Engineering. I am a hard-working, dedicated individual with a strong desire to continue learning and expanding my skillset in the field of computer science. I have a strong passion for mobile app development using Flutter framework. Through my experience as a mobile application developer, I have developed expertise in overcoming complex challenges, working collaboratively in groups, and adapting to the ever-changing technological environment.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}