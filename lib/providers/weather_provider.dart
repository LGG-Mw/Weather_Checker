import 'package:flutter/material.dart';
import 'package:weather/weather_conditions.dart';

class WeatherProvider extends ChangeNotifier {
  int tempInfahrenheit = 0;
  WeatherCondition condition = WeatherCondition.gloomy;
  bool fetched = false;

  updateWeather(int newTempfahrenheit, WeatherCondition newCondition){
    tempInfahrenheit = newTempfahrenheit;
    condition = newCondition;
    fetched = true;
    notifyListeners();
  }
}