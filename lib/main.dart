import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';
import 'package:news_weather_app_project/models/weather_model.dart';
import 'package:news_weather_app_project/services/weather_serivce.dart';
import 'package:news_weather_app_project/views/Weather_conrtol_view.dart';
import 'package:news_weather_app_project/views/Weather_home_default_view.dart';
import 'package:news_weather_app_project/views/weather_details_view.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_weather_app_project/views/widgets.dart';

void main() {

  runApp( MaterialApp( home: WeatherApp() ) );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        home: ControlView(),
      ),
    );
  }
}
