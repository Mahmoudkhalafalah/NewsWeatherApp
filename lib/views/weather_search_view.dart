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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search for Places',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
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
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Enter city name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ))),
            ),
          )),
    );
  }
}
