import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_task/model/weather_data_daily.dart';
import 'package:weather_task/utils/colors.dart';

class DailyDataForecastWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecastWidget({super.key, required this.weatherDataDaily});
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Next Days',
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 17,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherDataDaily.daily.length > 7
              ? 7
              : weatherDataDaily.daily.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          getDay(
                            weatherDataDaily.daily[index].dt,
                          ),
                          style: const TextStyle(
                              fontSize: 13, color: CustomColors.textColorBlack),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                            "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                      ),
                      Text(
                          "${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°")
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: CustomColors.dividerLine,
                )
              ],
            );
          })),
    );
  }
}
