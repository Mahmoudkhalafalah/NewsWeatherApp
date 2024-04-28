import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/weather_model.dart';
import '../../services/weather_serivce.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());

  late WeatherModel weatherModel;
  getWeather ({ required String cityName }) async {
    try {
      weatherModel = await WeatherService(Dio())
          .getWeatherData(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    } catch(e){
      emit(WeatherFailureState(
          e.toString()
      ));
    }
  }
}