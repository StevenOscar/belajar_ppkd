import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_7/checkbox_page.dart';
import 'package:flutter_app1/tugas/tugas_7/date_picker_page.dart';
import 'package:flutter_app1/tugas/tugas_7/dropdown_page.dart';
import 'package:flutter_app1/tugas/tugas_7/switch_page.dart';
import 'package:flutter_app1/tugas/tugas_7/time_picker_page.dart';
import 'package:flutter_app1/tugas/tugas_7/tugas_7_flutter.dart';
import 'package:flutter_app1/tugas/tugas_8/tugas_8_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: "Poppins"
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('id'), Locale('en')],
      // routes: {
      //   "/tugas_1": (context) => TugasSatuFlutter(),
      //   "/tugas_2": (context) => TugasDuaFlutter(),
      //   "/tugas_3": (context) => TugasTigaFlutter(),
      //   "/tugas_4": (context) => TugasEmpatFlutter(),
      //   "/tugas_5": (context) => TugasLimaFlutter(),
      //   "/tugas_6": (context) => TugasEnamFlutter(),
      //   "/test": (context) => TestNavigationPage(),
      // },
      // home: MeetSatu(),
      // home: MeetDua(),
      // home: MeetTigaA(),
      // home: MeetTigaB(),
      // home: MeetTigaC(),
      // home: MeetEmpat(),
      // home: Meet12AInputWidget(),
      // home: TugasSatuFlutter(),
      // home: TugasDuaFlutter(),
      // home: TugasTigaFlutter(),
      // home: TugasEmpatFlutter(),
      // home: TugasLimaFlutter(),
      // home: TugasEnamFlutter(),
      // home: Navigation(),
      // home: TugasTujuhFlutter(),
      home: TugasDelapanFlutter(),
    );
  }
}
