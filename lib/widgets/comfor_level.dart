import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_task/model/current_weather_data.dart';
import 'package:weather_task/utils/colors.dart';

class ComforLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComforLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            "Comfort Level",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                        handlerSize: 0,
                        trackWidth: 10,
                        progressBarWidth: 14,
                      ),
                      infoProperties: InfoProperties(
                          bottomLabelText: "Humidity",
                          bottomLabelStyle: const TextStyle(
                              letterSpacing: 0.1, fontSize: 14, height: 1.4)),
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomColors.firstGradientColor.withAlpha(100),
                          progressBarColors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Feels Like",
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}",
                        style: const TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    width: 1,
                    height: 25,
                    color: CustomColors.dividerLine,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "UV Index",
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: "${weatherDataCurrent.current.uvi}",
                        style: const TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
