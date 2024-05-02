class WeatherForecastModel {
  final String date;
  final int humidity;
  final double maxTemp;
  final double minTemp;
  final String icon;
  WeatherForecastModel({
    required this.date,
    required this.humidity,
    required this.maxTemp,
    required this.minTemp,
    required this.icon,
  });

  factory WeatherForecastModel.fromJson(json, int count) {
    return WeatherForecastModel(
      date: json['forecast']['forecastday'][count]['date'],
      humidity: json['forecast']['forecastday'][count]['day']['avghumidity'],
      maxTemp: json['forecast']['forecastday'][count]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][count]['day']['mintemp_c'],
      icon: json['forecast']['forecastday'][count]['day']['condition']['icon'],
    );
  }

  @override
  String toString() {
    return 'WeatherForecastModel{date: $date\n, humidity: $humidity\n, maxTemp: $maxTemp\n, minTemp: $minTemp\n}';
  }
}
