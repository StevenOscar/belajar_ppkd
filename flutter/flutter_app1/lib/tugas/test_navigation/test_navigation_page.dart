import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/test_navigation/navigation.dart';

class TestNavigationPage extends StatelessWidget {
  const TestNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.tugasEnam);
              },
              child: Text("Go to tugas 6  (push named)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.tugasEnam);
              },
              child: Text("Go to tugas 6  (push named replacement)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.tugasEnam,
                  (route) => true,
                );
              },
              child: Text("Go to tugas 6  (push named remove until)"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go back "),
            ),
          ],
        ),
      ),
    );
  }
}
