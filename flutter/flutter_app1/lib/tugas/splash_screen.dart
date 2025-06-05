import 'package:flutter/material.dart';
import 'package:flutter_app1/helper/preference_handler.dart';
import 'package:flutter_app1/meet_16/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changePage() {
    Future.delayed(Duration(seconds: 2), () async {
      bool isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      // if (isLogin) {
      //   Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     "/tugas_8",
      //     (route) => false,
      //   );
      // } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreenApp.id,
          (route) => false,
        );
      // }
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(52),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/images/bombardilo.jpg"),
              ),
            ),
            Text(
              "Ini splash screen",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
