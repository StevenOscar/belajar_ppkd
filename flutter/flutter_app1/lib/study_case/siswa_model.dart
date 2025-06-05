// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SiswaModel {
  final int? id;
  final String nama;
  final int umur;

  SiswaModel({
    this.id,
    required this.nama,
    required this.umur,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'umur': umur,
    };
  }

  factory SiswaModel.fromMap(Map<String, dynamic> map) {
    return SiswaModel(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      umur: map['umur'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SiswaModel.fromJson(String source) => SiswaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
