import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/controller/global_controller.dart';
import 'package:weather_task/utils/colors.dart';
import 'package:weather_task/widgets/comfor_level.dart';
import 'package:weather_task/widgets/current_weather_widget.dart';
import 'package:weather_task/widgets/header_widget.dart';
import 'package:weather_task/widgets/hourly_data_widget.dart';

import '../widgets/daily_data_forecast_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: Image.asset(
                    "assets/icons/clouds.png",
                    height: 200,
                    width: 200,
                  ),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),
                      CurrentWeather(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HourlyDataWidget(
                          weatherDataHOurly: globalController
                              .getWeatherData()
                              .getHourlyWeather()),
                      const SizedBox(
                        height: 20,
                      ),
                      DailyDataForecastWidget(
                        weatherDataDaily:
                            globalController.weatherData().getWeatherDaily(),
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ComforLevel(
                          weatherDataCurrent: globalController
                              .getWeatherData()
                              .getCurrentWeather())
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
