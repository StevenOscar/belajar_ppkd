import 'package:flutter/material.dart';

class MeetSatu extends StatelessWidget {
  const MeetSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter app 1"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                width: double.infinity,
              ),
              ListView.builder(
                itemCount: 20,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    leading: Icon(Icons.abc),
                    tileColor: Colors.white,
                    title: Text("test $index"),
                    subtitle: Text("Subtitle $index"),
                  );
                },
              ),
              ElevatedButton(onPressed: () {}, child: Text("test")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Pertemuan 1",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            "PPKD B 2",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text(
            "Kelas Mobile Programming",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Nama toko", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.blue)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Gambar 1", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, decoration: TextDecoration.underline))],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text.rich(
                TextSpan(
                  text: "Gambar 2",
                  style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: "@711161651",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue)
                    ),
                  ]
                )
              )
            ],
          ),
          Align(alignment: Alignment.center, child: Text("Gambar 3 Gambar 3Gambar 3Gambar 3Gambar 3Gambar 3 Gambar 3Gambar 3Gambar 3Gambar 3Gambar 3Gambar 3Gambar 3", overflow: TextOverflow.ellipsis,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Gambar 4")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Gambar 5")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Gambar 6")],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text("Gambar 1"),
                Text("Gambar 2"),
                Text("Gambar 3"),
                Text("Gambar 4"),
                Text("Gambar 5"),
                Text("Gambar 6"),
                Text("Gambar 6"),
                Text("Gambar 6"),
                Text("Gambar 6"),
                Text("Gambar 6"),
              ],
            ),
          ),
          Image.asset("images/public-speaking.jpg"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, color: Colors.blue, size: 40,),
              Text("Gambar 5"),
            ],
          ),
          // Image.network('https://picsum.photos/250?image=9')
        ],
      ),
    );
  }
}
