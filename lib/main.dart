import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/views/live_weather.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {  
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child:  const MaterialApp(
        home: LiveWeather()
      )
    );
  }
}
