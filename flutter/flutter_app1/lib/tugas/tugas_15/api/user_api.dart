import 'dart:convert';

import 'package:flutter_app1/tugas/tugas_15/helper/shared_preferences_helper.dart';
import 'package:flutter_app1/tugas/tugas_15/models/response_model.dart';
import 'package:flutter_app1/tugas/tugas_15/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static final String baseUrl = "https://absen.quidi.id";
  static final String registerUrl = "$baseUrl/api/register";
  static final String loginUrl = "$baseUrl/api/login";
  static final String getProfilUrl = "$baseUrl/api/get_profil";

  Future<ResponseModel> createUser({
    required String name,
    required String password,
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );

    if (response.statusCode == 200 || response.statusCode == 422) {
      return ResponseModel.fromJson(json: jsonDecode(response.body));
    } else {
      throw Exception("Error Register");
    }
  }

  Future<ResponseModel<UserModel>> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );
    if (response.statusCode == 200) {
      return ResponseModel<UserModel>.fromJson(
        json: jsonDecode(response.body),
        fromJsonT: (x) => UserModel.fromJson(x),
      );
    } else {
      return ResponseModel<UserModel>.fromJson(json: jsonDecode(response.body));
    }
  }

  Future<ResponseModel<UserModel>> getUserProfile() async {
    String token = await SharedPreferencesHelper.getToken() ?? "";
    final response = await http.post(
      Uri.parse(getProfilUrl),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      return ResponseModel<UserModel>.fromJson(
        json: jsonDecode(response.body),
        fromJsonT: (x) => UserModel.fromJson(x),
      );
    } else {
      return ResponseModel<UserModel>.fromJson(json: jsonDecode(response.body));
    }
  }
}
