import 'dart:convert';

import 'package:flutter/material.dart';

class ContractModel {
  ContractModel({
    required this.name,
    required this.id,
    required this.salary,
    required this.number,
    required this.invoise,
    required this.date,
    required this.color,
    required this.text,
  });

  late final String name;
  final int id;
  final String salary;
  final int number;
  final String invoise;
  final DateTime date;
  final Color color;
  final String text;

  factory ContractModel.fromRawJson(String str) =>
      ContractModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
        name: json["name"],
        id: json["id"],
        salary: json["salary"],
        number: json["number"],
        invoise: json["invoise"],
        date: json["date"],
        color:json['color'],
        text:json['text'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "salary": salary,
        "number": number,
        "invoise": invoise,
        "date": date,
        "color":color,
        "text":text,
      };
}
