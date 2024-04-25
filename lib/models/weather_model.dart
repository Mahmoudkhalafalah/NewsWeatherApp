class WeatherModel {
  final String lastUpdated;
  final String cityName;
  final String countryName;
  final String? windDirection;
  final String? sunRise;
  final String? moonRise;
  final String? sunSet;
  final String? moonSet;
  final String? moonPhase;
  final String weatherCondition;
  final String icon;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final double tempFeeling;
  final double? windSpeed;
  final double? pressure;
  final double? visibility;
  final double? airQuality;
  final double? uvIndex;
  final int? windDegree;
  final int? cloud;
  final int? humidity;
  final int? rainingPercentage;
  final int? isDay;
  final int? willRain;

  WeatherModel({
    required this.lastUpdated,
    required this.cityName,
    required this.countryName,
    this.windDirection,
    required this.weatherCondition,
    required this.icon,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.tempFeeling,
    this.windSpeed,
    this.windDegree,
    this.pressure,
    this.visibility,
    this.airQuality,
    this.uvIndex,
    this.cloud,
    this.rainingPercentage,
    this.isDay,
    this.willRain,
    this.humidity,
    this.sunRise,
    this.moonRise,
    this.sunSet,
    this.moonSet,
    this.moonPhase,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      lastUpdated: json['current']['last_updated'],
      cityName: json['location']['name'],
      countryName: json['location']['country'],
      weatherCondition: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
      currentTemp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      tempFeeling: json['current']['feelslike_c'],
      windDirection: json['current']['wind_dir'],
      windSpeed: json['current']['wind_kph'],
      windDegree: json['current']['wind_degree'],
      pressure: json['current']['pressure_mb'],
      visibility: json['current']['vis_km'],
      uvIndex: json['current']['uv'],
      cloud: json['current']['cloud'],
      willRain: json['forecast']['forecastday'][0]['day']['daily_will_it_rain'],
      isDay: json['current']['is_day'],
      rainingPercentage: json['forecast']['forecastday'][0]['day']
          ['daily_chance_of_rain'],
      humidity: json['current']['humidity'],
      moonPhase: json['forecast']['forecastday'][0]['astro']['moon_phase'],
      moonRise: json['forecast']['forecastday'][0]['astro']['moonrise'],
      moonSet: json['forecast']['forecastday'][0]['astro']['moonset'],
      sunRise: json['forecast']['forecastday'][0]['astro']['sunrise'],
      sunSet: json['forecast']['forecastday'][0]['astro']['sunset'],
      airQuality: json['forecast']['forecastday'][0]['day']['air_quality']
          ['pm2_5'],
    );
  }

  @override
  String toString() {
    return 'WeatherModel{lastUpdated: $lastUpdated\n, cityName: $cityName\n, countryName: $countryName\n, windDirection: $windDirection\n, sunRise: $sunRise\n, moonRise: $moonRise\n, sunSet: $sunSet\n, moonSet: $moonSet\n, moonPhase: $moonPhase\n, weatherCondition: $weatherCondition\n, icon: $icon\n, currentTemp: $currentTemp\n, maxTemp: $maxTemp\n, minTemp: $minTemp\n, tempFeeling: $tempFeeling\n, windSpeed: $windSpeed\n, pressure: $pressure\n, visibility: $visibility\n, airQuality: $airQuality\n, uvIndex: $uvIndex\n, windDegree: $windDegree\n, cloud: $cloud\n, humidity: $humidity\n, rainingPercentage: $rainingPercentage\n, isDay: $isDay\n, willRain: $willRain\n}';
  }
}
