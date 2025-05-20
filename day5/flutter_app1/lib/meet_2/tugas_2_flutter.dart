import 'package:flutter/material.dart';

class TugasDuaFlutter extends StatelessWidget {
  const TugasDuaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF435fdf),
      appBar: AppBar(
        title: Text(
          "Profil Lengkap",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF435fdf),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          CircleAvatar(
            foregroundColor: Colors.white,
            radius: 105,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/bombardilo.jpg"),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              "Steven Oscar",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Color(0xFF7c8dea)),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.white,),
                SizedBox(width: 5),
                Text(
                  "stevenoscar458@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.call), Spacer(), Text("0812-1044-3108")],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Postingan"),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Followers"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              child: Text(
                "Corrupti dolore quidem hic consequatur odio veritatis laboriosam dolor excepturi. Libero iure et delectus aut quo vel. Doloribus assumenda optio suscipit rem. Eligendi assumenda magnam doloremque sint. Eum ut animi consectetur impedit. Omnis recusandae voluptates ad illo culpa ducimus aspernatur sit ex. Perspiciatis est quod explicabo. Eveniet aliquam doloribus. Autem ut distinctio labore ea amet molestiae debitis.",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(children: [

            ],
          ),
        ],
      ),
    );
  }
}
