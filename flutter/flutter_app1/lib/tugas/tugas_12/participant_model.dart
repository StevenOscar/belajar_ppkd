// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ParticipantModel {
  int? id;
  String name;
  String email;
  String eventName;
  String city;
  String phoneNumber;
  int gender;
  DateTime eventDate;
  TimeOfDay eventTime;
  DateTime registeredAt;

  ParticipantModel({
    this.id,
    required this.name,
    required this.email,
    required this.eventName,
    required this.city,
    required this.phoneNumber,
    required this.gender,
    required this.eventDate,
    required this.eventTime,
    required this.registeredAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'event_name': eventName,
      'city': city,
      'phone_number': phoneNumber,
      'gender': gender,
      'event_date': eventDate.toIso8601String(),
      'event_time':
          '${eventTime.hour.toString().padLeft(2, '0')}:${eventTime.minute.toString().padLeft(2, '0')}',
      'registered_at': registeredAt.toIso8601String(),
    };
  }

  factory ParticipantModel.fromMap(Map<String, dynamic> map) {
    return ParticipantModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      eventName: map['event_name'] as String,
      city: map['city'] as String,
      phoneNumber: map['phone_number'] as String,
      gender: map['gender'] as int,
      eventDate: DateTime.parse(map['event_date']),
      eventTime: TimeOfDay(
        hour: int.parse(map['event_time'].split(':')[0]),
        minute: int.parse(map['event_time'].split(':')[1]),
      ),
      registeredAt: DateTime.parse(map['registered_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantModel.fromJson(String source) =>
      ParticipantModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
