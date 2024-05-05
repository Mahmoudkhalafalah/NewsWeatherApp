import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';
import 'package:news_weather_app_project/services/news_service.dart';
import 'package:news_weather_app_project/services/weather_service.dart';

import '../models/weather_model.dart';

class AppProvider extends ChangeNotifier{
  WeatherModel? weatherData;
  List<WeatherForecastModel>? weatherDataList;
  WeatherModel? weatherDataWithSearch;
  List<WeatherForecastModel>? weatherDataListWithSearch;
  WeatherService weatherService = WeatherService(Dio());
  NewsService newsService = NewsService(Dio());

  int _selectedIndex = 0;
  set selectedIndex (int index){
    _selectedIndex = index;
    notifyListeners();
  }
  int get selectedIndex => _selectedIndex;

  void setWeatherData() async{
    weatherData = await weatherService.getWeatherDataWithLocation();
    weatherDataList = await weatherService.getForecastWeatherDataWithLocation();
    notifyListeners();
  }
  void getWeatherDataWithLocation(String cityName) async{
    weatherDataWithSearch = await weatherService.getWeatherData(cityName: cityName);
    weatherDataListWithSearch = await weatherService.getForecastWeatherData(cityName: cityName);
  }

}