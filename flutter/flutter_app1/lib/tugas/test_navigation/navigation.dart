import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_6_flutter.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Test"), centerTitle: true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.tugasSatu);
                },
                child: Text("Go to tugas 1 (push named)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.tugasDua);
                },
                child: Text("Go to tugas 2 (push named)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.tugasTiga);
                },
                child: Text("Go to tugas 3 (push named)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.tugasEmpat);
                },
                child: Text("Go to tugas 4 (push named)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.tugasLima);
                },
                child: Text("Go to tugas 5 (push named)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.tugasEnam);
                },
                child: Text("Go to tugas 6 (push named)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TugasEnamFlutter()),
                  );
                },
                child: Text("Go to tugas 6 (push)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.tugasEnam);
                },
                child: Text("Go to tugas 6 (push replacement named)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.tugasEnam,
                    (route) => false,
                  );
                },
                child: Text("Go to tugas 6 (push named and remove until)"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.testNavigation,
                  );
                },
                child: Text("Go to test navigation page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Routes {
  static const tugasSatu = '/tugas_1';
  static const tugasDua = '/tugas_2';
  static const tugasTiga = "/tugas_3";
  static const tugasEmpat = "/tugas_4";
  static const tugasLima = "/tugas_5";
  static const tugasEnam = "/tugas_6";
  static const testNavigation = "/test";
}
