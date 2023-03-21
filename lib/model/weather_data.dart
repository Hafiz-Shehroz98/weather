import 'package:weather_task/model/current_weather_data.dart';
import 'package:weather_task/model/weather_data_daily.dart';
import 'package:weather_task/model/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHOurly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHOurly getHourlyWeather() => hourly!;
  WeatherDataDaily getWeatherDaily() => daily!;
}
