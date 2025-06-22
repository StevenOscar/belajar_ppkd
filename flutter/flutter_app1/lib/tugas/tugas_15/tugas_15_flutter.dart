import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_15/api/user_api.dart';
import 'package:flutter_app1/tugas/tugas_15/helper/shared_preferences_helper.dart';
import 'package:flutter_app1/tugas/tugas_15/screens/login_screen_15.dart';
import 'package:flutter_app1/tugas/tugas_15/screens/pokemon_list_screen_15.dart';

class TugasLimaBelasFlutter extends StatefulWidget {
  static const String id = "/tugas_15";
  const TugasLimaBelasFlutter({super.key});

  @override
  State<TugasLimaBelasFlutter> createState() => _TugasLimaBelasFlutterState();
}

class _TugasLimaBelasFlutterState extends State<TugasLimaBelasFlutter> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      final login = await SharedPreferencesHelper.getToken();
      if (login != null) {
        final userData = await UserApi().getUserProfile();
        if (!mounted) return;
        final user = userData.data?.user;
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PokemonListScreen15(userData: user)),
          );
        } else {
          Navigator.pushReplacementNamed(context, LoginScreen15.id);
        }
      } else {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, LoginScreen15.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/images/tugas_15/logo.png"), Text("Pokemon")],
        ),
      ),
    );
  }
}
