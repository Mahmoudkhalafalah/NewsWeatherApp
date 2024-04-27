import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:news_weather_app_project/views/weather_details_view.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';

class ControlView extends StatelessWidget {
  ControlView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit , WeatherState> (
        builder: (context , state) {
          if (state is InitialWeatherState){
            return  SearchView();
          } else if (state is WeatherLoadedState )
            {
              return  WeatherDetails();
            } else
              {
                return Text('opps there was an error');
              }
        },
      ),
    );
  }
}

