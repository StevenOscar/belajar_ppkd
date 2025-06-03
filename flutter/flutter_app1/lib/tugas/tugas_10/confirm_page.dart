import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget {
  final String name;
  final String email;
  final String? phoneNumber;
  final String city;
  const ConfirmPage({
    super.key,
    required this.name,
    required this.email,
    this.phoneNumber,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Terima kasih",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(32),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(height: 64),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 70,
                    child: Icon(Icons.check, color: Colors.white, size: 110),
                  ),
                  SizedBox(height: 32),
                  Text(
                    "Terima kasih, $name dari kota $city telah mendaftar.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 44),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
