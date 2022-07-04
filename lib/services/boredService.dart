import 'dart:convert';

import 'package:bored_api/data/models/BoredActivityModel.dart';
import 'package:http/http.dart' as http;

BoredActivityModel boredActivityFromJson(String str) => BoredActivityModel.fromJson(jsonDecode(str));

String boredActivityToJson(BoredActivityModel data) => jsonEncode(data.toJson());

class BoredService {
  Future<BoredActivityModel> getBoredActivity() async {
    await Future<void>.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse('http://www.boredapi.com/api/activity/'));
    final activity = boredActivityFromJson(response.body);
    return activity;
  }
}