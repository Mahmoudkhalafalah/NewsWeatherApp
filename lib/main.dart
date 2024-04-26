import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';
import 'package:news_weather_app_project/models/weather_model.dart';
import 'package:news_weather_app_project/services/weather_serivce.dart';
import 'package:news_weather_app_project/views/weather_details_view.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';

void main() {
  runApp(MaterialApp(home: WeatherDetails()));
}


