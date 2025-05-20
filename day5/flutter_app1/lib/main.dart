import 'package:flutter/material.dart';
import 'package:flutter_app1/meet_1/meet_1.dart';
import 'package:flutter_app1/meet_1/tugas_1_flutter.dart';
import 'package:flutter_app1/meet_2/meet_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: MeetDua(),
      home: TugasSatuFlutter(),
      // home: MeetSatu(),
    );
  }
}