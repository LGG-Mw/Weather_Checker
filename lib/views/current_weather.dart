import 'package:flutter/material.dart';

import '../weather_conditions.dart';
import 'big_temp.dart';
import 'space_needle_in_a_circle.dart';
import 'weather_condition_widget.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key, this.tempInfahrenheit=420, this.condition=WeatherCondition.sunny});

  final WeatherCondition condition;
  final int tempInfahrenheit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColorForCondition(condition),
      body: SingleChildScrollView(child:
        Center(child: 
          Column(
            children: [
              Container(height: 16),
              const Padding(
                padding:  EdgeInsets.all(16.0)
              ),
              const SpaceNeedleInACircle(),
              BigTemp(tempInfahrenheit),
              WeatherConditionWidget(condition),
            ]
          )
        )
      )
    );
  }

  // Takes in  WeatherCondition parameter and return a color accordingly
  // WeatherCondition condition: the weather condition
  // return: return a color accordinly
  Color _backgroundColorForCondition(WeatherCondition condition){
    return switch (condition) {
      WeatherCondition.gloomy => Colors.grey[800]!,
      WeatherCondition.sunny => Colors.yellow[600]!,
      _ => Colors.blue[800]!
  };
  }

}
