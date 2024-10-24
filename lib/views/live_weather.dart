import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/helpers/weather_checker.dart';
import 'package:weather/providers/weather_provider.dart';

import '../weather_conditions.dart';
import 'big_temp.dart';
import 'space_needle_in_a_circle.dart';
import 'weather_condition_widget.dart';
import 'package:http/http.dart' as http;

// class that gets and updates real time weather data
class LiveWeather extends StatefulWidget {
  const LiveWeather({super.key});

  @override
  State<LiveWeather> createState() => _LiveWeatherState();
}


class _LiveWeatherState extends State<LiveWeather> {
  Timer? _weatherCheckerTimer;

  @override
  initState(){
    super.initState();
    // access the provider for initiating
    final singleUseWeatherProvider = Provider.of<WeatherProvider>(context, listen: false); //false because this is only used when initiating
    _createAndFetchWeather(singleUseWeatherProvider);
    _weatherCheckerTimer = Timer.periodic(
      Duration(seconds: 1), 
      (_weatherCheckerTimer){_createAndFetchWeather(singleUseWeatherProvider);}
    );
  }

  // cancel the current timer
  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    _weatherCheckerTimer?.cancel();
    super.dispose();
  }

  // refetch the weather data
  void _createAndFetchWeather(WeatherProvider weatherProvider) {
    // Create a new instance of WeatherChecker with a fresh http.Client
    final WeatherChecker weatherChecker = WeatherChecker(weatherProvider);
    
    // Fetch and update the current Seattle weather
    weatherChecker.fetchAndUpdateCurrentSeattleWeather();
  } 

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, other){
        if (provider.fetched){
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
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
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