import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';
import 'package:news_weather_app_project/services/location_service.dart';

import '../models/weather_model.dart';

class WeatherService {
  final baseUrl = 'http://api.weatherapi.com/v1';
  final apiKey = 'c97b47f48c1e4012b2d34239241505';
  final Dio dio;
  List<WeatherForecastModel> weatherForecastModel =
      List<WeatherForecastModel>.filled(
          7,
          WeatherForecastModel(
              date: "date", humidity: 1, maxTemp: 1, minTemp: 1, icon: ""));
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

  Future<WeatherModel> getWeatherDataWithLocation() async {
    Position pos = await LocationService().determinePosition();
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=${pos.latitude},${pos.longitude}&aqi=yes');
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

  Future<List<WeatherForecastModel>>
      getForecastWeatherDataWithLocation() async {
    Position pos = await LocationService().determinePosition();
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=${pos.latitude},${pos.longitude}&days= 7&aqi=yes');

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
