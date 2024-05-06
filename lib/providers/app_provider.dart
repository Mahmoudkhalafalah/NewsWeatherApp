import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/models/article_model.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';
import 'package:news_weather_app_project/services/news_service.dart';
import 'package:news_weather_app_project/services/weather_service.dart';

import '../models/weather_model.dart';

class AppProvider extends ChangeNotifier {
  WeatherService weatherService = WeatherService(Dio());
  NewsService newsService = NewsService(Dio());

  WeatherModel? weatherData;
  List<WeatherForecastModel>? weatherDataList;
  WeatherModel? weatherDataWithSearch;
  List<WeatherForecastModel>? weatherDataListWithSearch;

  List<ArticleModel>? generalArticles;

  int _selectedIndex = 0;

  Icon loginPasswordFieldIcon = const Icon(Icons.remove_red_eye_rounded);
  bool loginPassWordVisible = true;

  Icon signUpPasswordFieldIcon = const Icon(Icons.remove_red_eye_rounded);
  bool signUpPassWordVisible = true;

  bool _signInAnonymous = false;
  set signInAnonymous(bool value) {
    _signInAnonymous = value;
    notifyListeners();
  }

  bool get signInAnonymous => _signInAnonymous;
  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  void setWeatherData() async {
    weatherData ??= await weatherService.getWeatherDataWithLocation();
    weatherDataList ??=
        await weatherService.getForecastWeatherDataWithLocation();
    notifyListeners();
  }

  void getWeatherDataWithLocation(String cityName) async {
    weatherDataWithSearch =
        await weatherService.getWeatherData(cityName: cityName);
    weatherDataListWithSearch =
        await weatherService.getForecastWeatherData(cityName: cityName);
  }

  void getGeneralNews() async {
    generalArticles ??= await newsService.getTopHeadlines(category: "general");
    notifyListeners();
  }

  void changeLoginPassVisibility() {
    loginPassWordVisible = !loginPassWordVisible;
    loginPasswordFieldIcon = (loginPassWordVisible)
        ? const Icon(Icons.remove_red_eye_rounded)
        : const Icon(Icons.remove_red_eye_outlined);
    notifyListeners();
  }

  void changeSignUpPassVisibility() {
    signUpPassWordVisible = !signUpPassWordVisible;
    signUpPasswordFieldIcon = (signUpPassWordVisible)
        ? const Icon(Icons.remove_red_eye_rounded)
        : const Icon(Icons.remove_red_eye_outlined);
    notifyListeners();
  }
}
