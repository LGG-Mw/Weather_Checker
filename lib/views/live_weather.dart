import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';

import '../weather_conditions.dart';
import 'big_temp.dart';
import 'space_needle_in_a_circle.dart';
import 'weather_condition_widget.dart';

class LiveWeather extends StatefulWidget {
  const LiveWeather({super.key});

  @override
  State<LiveWeather> createState() => _LiveWeatherState();
}

class _LiveWeatherState extends State<LiveWeather> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, other){
        return Scaffold(
          backgroundColor: _backgroundColorForCondition(provider.condition),
          body: SingleChildScrollView(child:
            Center(child: 
              Column(
                children: [
                  Container(height: 16),
                  const Padding(
                    padding:  EdgeInsets.all(16.0)
                  ),
                  const SpaceNeedleInACircle(),
                  BigTemp(provider.tempInfahrenheit),
                  WeatherConditionWidget(provider.condition),
                ]
              )
            )
          )
        );
      }
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