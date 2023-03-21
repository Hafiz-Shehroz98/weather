import 'package:flutter/material.dart';
import 'package:weather_task/model/current_weather_data.dart';
import 'package:weather_task/utils/colors.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeather({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureWidget(),
        SizedBox(
          height: 15,
        ),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temperatureWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Image.asset("assets/weather/03d.png"),
        Image.asset(
          'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png',
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "${weatherDataCurrent.current.temp!.toInt()}°",
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textColorBlack),
            ),
            TextSpan(
              text: "${weatherDataCurrent.current.weather![0].description}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey),
            ),
          ]),
        ),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.windSpeed}km/h",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds}%",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.humidity}%",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
