import 'dart:convert';

import 'package:weather_task/model/current_weather_data.dart';
import 'package:weather_task/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_task/model/weather_data_daily.dart';
import 'package:weather_task/model/weather_data_hourly.dart';

import '../utils/api_Url.dart';

class FetchWeatherApi {
  WeatherData? weatherData;
  // process data
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHOurly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}
