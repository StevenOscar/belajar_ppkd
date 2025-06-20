import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_15/models/user_model.dart';

class ProfileScreen15 extends StatefulWidget {
  final User userData;

  const ProfileScreen15({super.key, required this.userData});

  @override
  State<ProfileScreen15> createState() => _ProfileScreen15State();
}

class _ProfileScreen15State extends State<ProfileScreen15> {
  User? userData;

  @override
  void initState() {
    
    super.initState();
  }

  void getUserData(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(title: Text(userData!.name ?? ""), subtitle: Text(userData!.email ?? "")),
    );
  }
}
