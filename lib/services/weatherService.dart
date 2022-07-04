import 'dart:convert';

import 'package:bored_api/data/models/WeatherModel.dart';
import 'package:http/http.dart' as http;

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(jsonDecode(str));

String weatherModelToJson(WeatherModel data) => jsonEncode(data.toJson());

class WeatherService {
  Future<WeatherModel> getWeather() async {
    await Future<void>.delayed(Duration(seconds: 1));
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=natal,br&units=metric&appid=056e209564bf0be90fdde3540692cf12&lang=pt_br'));
    final temperature = weatherModelFromJson(response.body);
    return temperature;
  }
}