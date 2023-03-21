// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:weather_task/controller/global_controller.dart';

import 'package:weather_task/model/weather_data_hourly.dart';
import 'package:weather_task/utils/colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHOurly weatherDataHOurly;
  HourlyDataWidget({super.key, required this.weatherDataHOurly});
  RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            "Today",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherDataHOurly.hourly.length > 12
              ? 12
              : weatherDataHOurly.hourly.length,
          itemBuilder: (context, index) {
            return Obx((() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  width: 90,
                  margin: const EdgeInsets.only(left: 20, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0.5, 0),
                            blurRadius: 30,
                            spreadRadius: 1,
                            color: CustomColors.dividerLine.withAlpha(150)),
                      ],
                      gradient: cardIndex.value == index
                          ? const LinearGradient(colors: [
                              CustomColors.firstGradientColor,
                              CustomColors.secondGradientColor
                            ])
                          : null),
                  child: HourlyDetails(
                    index: index,
                    cardtIndex: cardIndex.toInt(),
                    timeStamp: weatherDataHOurly.hourly[index].dt!,
                    temp: weatherDataHOurly.hourly[index].temp!,
                    weatherIcon:
                        weatherDataHOurly.hourly[index].weather![0].icon!,
                  ),
                ))));
          }),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;
  int index;
  int cardtIndex;
  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  HourlyDetails(
      {Key? key,
      required this.timeStamp,
      required this.temp,
      required this.weatherIcon,
      required this.index,
      required this.cardtIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
                color: cardtIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$temp°",
            style: TextStyle(
                color: cardtIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          ),
        )
      ],
    );
  }
}
