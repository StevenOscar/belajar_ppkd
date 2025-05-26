import 'package:flutter/material.dart';
import 'package:flutter_app1/meet_4/meet_4.dart';
import 'package:flutter_app1/meet_1/meet_1.dart';
import 'package:flutter_app1/tugas/tugas_1_flutter.dart';
import 'package:flutter_app1/meet_2/meet_2.dart';
import 'package:flutter_app1/tugas/tugas_2_flutter.dart';
import 'package:flutter_app1/meet_3/meet_3a.dart';
import 'package:flutter_app1/meet_3/meet_3b.dart';
import 'package:flutter_app1/meet_3/meet_3c.dart';
import 'package:flutter_app1/tugas/tugas_3_flutter.dart';
import 'package:flutter_app1/tugas/tugas_4_flutter.dart';
import 'package:flutter_app1/tugas/tugas_5_flutter.dart';
import 'package:flutter_app1/tugas/tugas_6_flutter.dart';

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
      // home: MeetSatu(),
      // home: MeetDua(),
      // home: MeetTigaA(),
      // home: MeetTigaB(),
      // home: MeetTigaC(),
      // home: MeetEmpat(),
      // home: TugasSatuFlutter(),
      // home: TugasDuaFlutter(),
      // home: TugasTigaFlutter(),
      // home: TugasEmpatFlutter(),
      // home: TugasLimaFlutter(),
      home: TugasEnamFlutter(),
    );
  }
}