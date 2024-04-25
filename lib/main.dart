import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';
import 'package:news_weather_app_project/models/weather_model.dart';
import 'package:news_weather_app_project/services/weather_serivce.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          WeatherService weatherService = WeatherService(Dio());
          WeatherModel weatherModel = await weatherService.getWeatherData(cityName: "cairo");
          log(weatherModel.toString());
          List<WeatherForecastModel> weatherForecastModel = await weatherService.getForecastWeatherData(cityName: "cairo");

          log(weatherForecastModel.toString());
          for (int i = 0; i < 7; i++) {
            log('${getDayName(weatherForecastModel[i].date)}\n');
          }
        },
      ),
    ),
  ));
}

String getDayName(String dateString) {
  DateTime date = DateFormat('yyyy-MM-dd').parse(dateString);
  List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  return days[date.weekday-1];
}