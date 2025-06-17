import 'package:flutter/material.dart';
import 'package:flutter_app1/meet_16/login_screen.dart';
import 'package:flutter_app1/meet_16/register_screen.dart';
import 'package:flutter_app1/meet_22/views/list_user_screen.dart';
import 'package:flutter_app1/study_case/siswa_screen_app.dart';
import 'package:flutter_app1/tugas/test_navigation/test_navigation_page.dart';
import 'package:flutter_app1/tugas/tugas_11/tugas_11_flutter.dart';
import 'package:flutter_app1/tugas/tugas_12/tugas_12_flutter.dart';
import 'package:flutter_app1/tugas/tugas_14/screen/tugas_14_flutter.dart';
import 'package:flutter_app1/tugas/tugas_1_flutter.dart';
import 'package:flutter_app1/tugas/tugas_2_flutter.dart';
import 'package:flutter_app1/tugas/tugas_3_flutter.dart';
import 'package:flutter_app1/tugas/tugas_4_flutter.dart';
import 'package:flutter_app1/tugas/tugas_5_flutter.dart';
import 'package:flutter_app1/tugas/tugas_6_flutter.dart';
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
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red), fontFamily: "Poppins"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: [Locale('id'), Locale('en')],
      routes: {
        // "/": (context) => SplashScreen(),
        "/tugas_1": (context) => TugasSatuFlutter(),
        "/tugas_2": (context) => TugasDuaFlutter(),
        "/tugas_3": (context) => TugasTigaFlutter(),
        "/tugas_4": (context) => TugasEmpatFlutter(),
        "/tugas_5": (context) => TugasLimaFlutter(),
        "/tugas_6": (context) => TugasEnamFlutter(),
        "/tugas_7": (context) => TugasTujuhFlutter(),
        "/tugas_8": (context) => TugasDelapanFlutter(),
        "/test": (context) => TestNavigationPage(),
        LoginScreenApp.id: (context) => LoginScreenApp(),
        RegisterScreenApp.id: (context) => RegisterScreenApp(),
        SiswaScreenApp.id: (context) => SiswaScreenApp(),
        TugasSebelasFlutter.id: (context) => TugasSebelasFlutter(),
        TugasDuaBelasFlutter.id: (context) => TugasDuaBelasFlutter(),
        TugasEmpatBelasFlutter.id: (context) => TugasEmpatBelasFlutter(),
        ListUserScreen.id: (context) => ListUserScreen(),
      },
      initialRoute: TugasEmpatBelasFlutter.id,
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
      // home: TugasDelapanFlutter(),
      // home: TugasSembilanFlutter(),
      // home: TugasSepuluhFlutter(),
      // home: SplashScreen(),
    );
  }
}
