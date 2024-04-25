import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';

import '../models/weather_model.dart';

class WeatherService {
  final baseUrl = 'http://api.weatherapi.com/v1';
  final apiKey = '2f8decbf816447469f8142742242404';
  final Dio dio;
  List<WeatherForecastModel> weatherForecastModel =
      List<WeatherForecastModel>.filled(
          7,
          WeatherForecastModel(
              date: "date", humidity: 1, maxTemp: 1, minTemp: 1));
  WeatherService(this.dio);
  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&aqi=yes');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final errMsg = e.response?.data['error']['message'] ?? ', Try Later';
      throw Exception(errMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('Error, Try Later');
    }
  }

  Future<List<WeatherForecastModel>> getForecastWeatherData(
      {required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

      for (int i = 0; i < 7; i++) {
        weatherForecastModel[i] =
            WeatherForecastModel.fromJson(response.data, i);
      }
      return weatherForecastModel;
    } on DioException catch (e) {
      final errMsg = e.response?.data['error']['message'] ?? ', Try Later';
      throw Exception(errMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('Error, Try Later');
    }
  }
}
