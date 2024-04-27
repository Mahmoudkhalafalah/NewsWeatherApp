import '../../models/weather_model.dart';

class WeatherState {}

class InitialWeatherState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weathermodel;

  WeatherLoadedState(this.weathermodel);
}

class WeatherFailureState extends WeatherState{
  final String errorMsg;
  WeatherFailureState(this.errorMsg);
}
