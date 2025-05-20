import 'package:flutter/material.dart';

class TugasSatuFlutter extends StatelessWidget {
  const TugasSatuFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Profil Saya", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 65),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
              border: Border.all(color: Colors.black, width: 2)
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                Text(
                  "Steven Oscar",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 5,),
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
          SizedBox(height: 40,),
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