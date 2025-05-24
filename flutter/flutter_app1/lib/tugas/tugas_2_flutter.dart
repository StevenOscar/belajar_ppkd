import 'package:flutter/material.dart';

class TugasDuaFlutter extends StatelessWidget {
  const TugasDuaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
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
            SizedBox(height: 30),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 95,
              child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("assets/images/bombardilo.jpg"),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "Steven Oscar",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF7c8dea),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.2, 0.5)
                        )
                      ]
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.email, color: Colors.white, size: 25,),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "stevenoscar458@gmail.com",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFd9d9d9),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.2, 0.5)
                        )
                      ]
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call,
                          size: 25,
                          color: Color(0xFF20203a),
                        ),
                        Spacer(),
                        Text(
                          "0812-1044-3108",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF7c8dea),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1.2, 0.5)
                              )
                            ]
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Postingan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1.2, 0.5)
                              )
                            ]
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Followers",
                            style: TextStyle(
                              color: Color(0xFF7c8dea),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, left: 4, right: 4),
                      child: Text(
                        "I am a fresh graduate of Esa Unggul University majoring in Informatics Engineering. I am a hard-working, dedicated individual with a strong desire to continue learning and expanding my skillset in the field of computer science. I have a strong passion for mobile app development using Flutter framework. Through my experience as a mobile application developer, I have developed expertise in overcoming complex challenges, working collaboratively in groups, and adapting to the ever-changing technological environment.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: Center(
                child: Text(
                  "Dibuat dengan Semangat dan Dedikasi 👍",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
