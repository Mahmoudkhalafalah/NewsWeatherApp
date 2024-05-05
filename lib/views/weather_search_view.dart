import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';
import 'package:news_weather_app_project/models/weather_model.dart';
import 'package:news_weather_app_project/services/weather_service.dart';
import 'package:news_weather_app_project/views/weather_details_view.dart';

WeatherService weatherService = WeatherService(Dio());

class SearchView extends StatelessWidget {
  SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xFF323A69),
            Color(0xff323A6B),
            Color(0xFF374270),
            Color(0xFF3E4977),
            Color(0xFF4F598A),
            Color(0xFF525D93),
            Color(0xFF535D98),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Search for Places',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                WeatherModel? weatherModel;
                List<WeatherForecastModel>? weatherDataList;
                try {
                  weatherModel =
                      await weatherService.getWeatherData(cityName: value);
                  weatherDataList = await weatherService.getForecastWeatherData(
                      cityName: value);
                } on Exception catch (e) {
                  Fluttertoast.showToast(msg: e.toString());
                }
                if (weatherModel != null && weatherDataList != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeatherDetailsWithSearch(
                                weatherDetails: weatherModel!,
                                weatherDataList: weatherDataList!,
                              )));
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                labelText: 'Search',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Enter city name',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
