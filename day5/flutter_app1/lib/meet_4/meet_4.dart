import 'package:flutter/material.dart';

class MeetEmpat extends StatelessWidget {
  const MeetEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF53716d), title: Text("test")),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.red,
        child: Text("data",
        style: TextStyle(fontSize: 12),),
      ),
    );
  }
}
