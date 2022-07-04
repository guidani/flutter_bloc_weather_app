// To parse this JSON data, do
//
//     final boredActivity = boredActivityFromJson(jsonString);

import 'dart:convert';

// BoredActivityModel boredActivityFromJson(String str) => BoredActivityModel.fromJson(jsonDecode(str));
//
// String boredActivityToJson(BoredActivityModel data) => json.encode(data.toJson());

class BoredActivityModel {
  BoredActivityModel({
    required this.activity,
    required this.accessibility,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
  });

  final String activity;
  final double accessibility;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;

  factory BoredActivityModel.fromJson(Map<String, dynamic> json) => BoredActivityModel(
    activity: json["activity"],
    accessibility: json["accessibility"].toDouble(),
    type: json["type"],
    participants: json["participants"],
    price: json["price"].toDouble(),
    link: json["link"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "activity": activity,
    "accessibility": accessibility,
    "type": type,
    "participants": participants,
    "price": price,
    "link": link,
    "key": key,
  };
}