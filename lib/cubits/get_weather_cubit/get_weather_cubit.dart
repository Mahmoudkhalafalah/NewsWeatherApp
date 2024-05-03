import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/weather_model.dart';
import '../../services/weather_serivce.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());

  late WeatherModel weatherModell;
  getWeather ({ required String cityName }) async {
    try {
       weatherModell = await WeatherService(Dio())
          .getWeatherData(cityName: cityName);
      emit(WeatherLoadedState(weatherModell));
    } catch(e){
      emit(WeatherFailureState(
          e.toString()
      ));
    }
  }
}