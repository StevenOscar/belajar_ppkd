import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_7/tugas_7_flutter.dart';
import 'package:flutter_app1/tugas/tugas_8/about_page.dart';

class TugasDelapanFlutter extends StatefulWidget {
  const TugasDelapanFlutter({super.key});

  @override
  State<TugasDelapanFlutter> createState() => _TugasDelapanFlutterState();
}

class _TugasDelapanFlutterState extends State<TugasDelapanFlutter> {
  final List<Widget> _screen = [TugasTujuhFlutter(), AboutPage()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "About",
          ),
        ],
      ),
      body: _screen[currentIndex],
    );
  }
}
