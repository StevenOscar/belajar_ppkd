import 'package:flutter/material.dart';
import 'package:flutter_app1/tugas/tugas_15/api/user_api.dart';
import 'package:flutter_app1/tugas/tugas_15/helper/shared_preferences_helper.dart';
import 'package:flutter_app1/tugas/tugas_15/models/user_model.dart';
import 'package:flutter_app1/tugas/tugas_15/screens/login_screen_15.dart';

class ProfileScreen15 extends StatefulWidget {
  final User userData;
  final Future<void> Function() reloadProfile;

  const ProfileScreen15({super.key, required this.userData, required this.reloadProfile});

  @override
  State<ProfileScreen15> createState() => _ProfileScreen15State();
}

class _ProfileScreen15State extends State<ProfileScreen15> {
  late User userData;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
    nameController = TextEditingController(text: userData.name ?? "");
  }

  void logout() async {
    await SharedPreferencesHelper.deleteToken();
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen15.id, (route) => false);
  }

  Future<void> updateProfile() async {
    await UserApi().editUserProfile(name: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(controller: nameController),
          Text(userData.email ?? ""),
          Text(userData.createdAt.toString()),
          Text(userData.emailVerifiedAt.toString()),
          Text(userData.id.toString()),
          Text(userData.updatedAt.toString()),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await updateProfile();
                await widget.reloadProfile();
                Navigator.pop(context);
              },
              child: Text("Edit"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                logout();
              },
              child: Text("Log out"),
            ),
          ),
        ],
      ),
    );
  }
}
