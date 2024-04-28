import '../../models/weather_model.dart';

class WeatherState {}

class InitialWeatherState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState{
  final String errorMsg;
  WeatherFailureState(this.errorMsg);
}
