class WeatherForecastModel {
  final String date;
  final int humidity;
  final double maxTemp;
  final double minTemp;

  WeatherForecastModel(
      {required this.date,
      required this.humidity,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherForecastModel.fromJson(json, int count) {
    return WeatherForecastModel(
        date: json['forecast']['forecastday'][count]['date'],
        humidity: json['forecast']['forecastday'][count]['day']['avghumidity'],
        maxTemp: json['forecast']['forecastday'][count]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][count]['day']['mintemp_c']);
  }

  @override
  String toString() {
    return 'WeatherForecastModel{date: $date\n, humidity: $humidity\n, maxTemp: $maxTemp\n, minTemp: $minTemp\n}';
  }
}
