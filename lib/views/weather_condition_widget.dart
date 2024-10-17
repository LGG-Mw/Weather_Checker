import 'package:flutter/material.dart';
import 'package:weather/weather_conditions.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget(this.condition, {super.key });

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    final iconToShow = Icons.__________ // TODO(you): Choose an appropriate icon based on condition
    final textToShow = // TODO(you): Generate appropriate text to show based on condition 

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconToShow),
        Text(
          textToShow,
          style: TextStyle(fontSize: 24)
        ),
      ]
    );
    
  }
}