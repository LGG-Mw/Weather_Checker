import 'package:flutter/material.dart';
import 'package:weather/weather_conditions.dart';

class WeatherProvider extends ChangeNotifier {
  int tempInfahrenheit = 0;
  WeatherCondition condition = WeatherCondition.gloomy;
  bool fetched = false;
  String? error;

  void updateWeather(int newTempfahrenheit, WeatherCondition newCondition){
    tempInfahrenheit = newTempfahrenheit;
    condition = newCondition;
    fetched = true;
    error = null;
    notifyListeners();
  }

  void setError(String message){
    error = message;
    fetched = false;
    notifyListeners();
  }
}