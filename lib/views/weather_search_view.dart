import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news_weather_app_project/services/weather_serivce.dart';
import 'package:news_weather_app_project/views/weather_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/weather_model.dart';

/*
class SearchView extends StatelessWidget {
  SearchView ({super.key, this.updateUI});
  VoidCallback? updateUI;
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
          /*    Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    Navigator.pop(context);
                  },
                  )
              ); */
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ) ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField (
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);

              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const WeatherDetails()
                  )
               );
              },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              labelText: 'Search',
              suffixIcon: const Icon(Icons.search),
              hintText: 'Enter city name',
              border: OutlineInputBorder (
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black,
                )
              )
            ),
          ),
        )
      ),
    );
  }
}

*/