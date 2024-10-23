import 'package:flutter/material.dart';
import 'package:weather/weather_conditions.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget(this.condition, {super.key });

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    final iconToShow = switch(condition) {
      WeatherCondition.gloomy => Icons.cloud,
      WeatherCondition.sunny => Icons.sunny,
      _ => Icons.water_drop_rounded,
    };
    final textToShow = switch(condition) {
      WeatherCondition.gloomy => 'Gloomy',
      WeatherCondition.sunny => 'Sunny',
      _ => 'Rainy',
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconToShow),
        Text(
          textToShow,
          style: const TextStyle(fontSize: 24)
        ),
      ]
    );
    
  }
}