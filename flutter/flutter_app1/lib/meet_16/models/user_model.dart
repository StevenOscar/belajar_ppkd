import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String? email;
  final String? name;
  final String username;
  final String? phone;
  final String password;

  UserModel({this.email, this.name, required this.username, this.phone, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'name': name, 'username': username, 'phone': phone, 'password': password};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      username: map['username'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
