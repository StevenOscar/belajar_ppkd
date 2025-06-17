import 'dart:convert';

import 'package:flutter_app1/meet_22/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> getUsers() async {
  final response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)["data"];
    return userJson.map((json) => UserModel.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load users");
  }
}
