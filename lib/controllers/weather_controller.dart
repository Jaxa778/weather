// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherController {
  Future<List<WeatherModel>> getWeather(String city) async {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=4fbcaea02da3f8d21a4ac27cfc5dca4c",
    );
    final response = await http.get(url);
    Map<String, WeatherModel> days = {};
    final getedWeather = jsonDecode(response.body);

    List<dynamic> weatherList = getedWeather['list'];

    for (var i in weatherList) {
      String date = i['dt_txt'].split(" ")[0];
      if (!days.containsKey(date)) {
        days[date] = WeatherModel.fromMap(i);
      }
    }
    return days.values.toList();
  }
}
