import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news_weather_app_project/services/weather_serivce.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';
import 'package:news_weather_app_project/views/widgets.dart';
import '../models/weather_forecast_model.dart';
import '../models/weather_model.dart';

WeatherModel? weatherModel;
List<WeatherForecastModel>? weatherDataList;

class WeatherHomeDetails extends StatefulWidget {
  const WeatherHomeDetails({Key? key});

  @override
  State<WeatherHomeDetails> createState() => _WeatherHomeDetailsState();
}

class _WeatherHomeDetailsState extends State<WeatherHomeDetails> {
  void updateUI() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WeatherService weatherService = WeatherService(Dio());
    weatherService.getWeatherDataWithLocation().then((value) => {
          setState(() {
            weatherModel = value;
          })
        });
    weatherService.getForecastWeatherDataWithLocation().then((value) => {
          setState(() {
            weatherDataList = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    if (weatherDataList == null || weatherModel == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFF323A69),
              Color(0xff323A6B),
              Color(0xFF374270),
              Color(0xFF3E4977),
              Color(0xFF4F598A),
              Color(0xFF525D93),
              Color(0xFF535D98),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SearchView(
                        updateUI: updateUI,
                      );
                    },
                  ));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weatherModel?.cityName ?? "N/A",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            weatherModel?.countryName ?? "N/A",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            weatherModel?.weatherCondition ?? "N/A",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            '${(weatherModel?.maxTemp ?? 0).toInt()}° / ${(weatherModel?.minTemp ?? 0).toInt()}° feels like ${(weatherModel?.tempFeeling ?? 0).toInt()}°',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        'https:${weatherModel?.icon ?? "//cdn.weatherapi.com/weather/64x64/night/113.png"}',
                        cacheWidth: 200,
                        cacheHeight: 200,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomContainer(
                    child: Column(
                      children: [
                        CustomForecastDayWidget(
                          day: getDayName(
                              weatherDataList?[0].date ?? "2024-05-01"),
                          humidity: weatherDataList?[0].humidity,
                          srcImage: weatherDataList?[0].icon,
                          maxTemp: weatherDataList?[0].maxTemp,
                          minTemp: weatherDataList?[0].minTemp,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomForecastDayWidget(
                          day: getDayName(
                              weatherDataList?[1].date ?? "2024-05-01"),
                          humidity: weatherDataList?[1].humidity,
                          srcImage: weatherDataList?[1].icon,
                          maxTemp: weatherDataList?[1].maxTemp,
                          minTemp: weatherDataList?[1].minTemp,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomForecastDayWidget(
                          day: getDayName(
                              weatherDataList?[2].date ?? "2024-05-01"),
                          humidity: weatherDataList?[2].humidity,
                          srcImage: weatherDataList?[2].icon,
                          maxTemp: weatherDataList?[2].maxTemp,
                          minTemp: weatherDataList?[2].minTemp,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomForecastDayWidget(
                          day: getDayName(
                              weatherDataList?[3].date ?? "2024-05-01"),
                          humidity: weatherDataList?[3].humidity,
                          srcImage: weatherDataList?[3].icon,
                          maxTemp: weatherDataList?[3].maxTemp,
                          minTemp: weatherDataList?[3].minTemp,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomForecastDayWidget(
                          day: getDayName(
                              weatherDataList?[4].date ?? "2024-05-01"),
                          humidity: weatherDataList?[4].humidity,
                          srcImage: weatherDataList?[4].icon,
                          maxTemp: weatherDataList?[4].maxTemp,
                          minTemp: weatherDataList?[4].minTemp,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomForecastDayWidget(
                          day: getDayName(
                              weatherDataList?[5].date ?? "2024-05-01"),
                          humidity: weatherDataList?[5].humidity,
                          srcImage: weatherDataList?[5].icon,
                          maxTemp: weatherDataList?[5].maxTemp,
                          minTemp: weatherDataList?[5].minTemp,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomForecastDayWidget(
                          day: getDayName(
                              weatherDataList?[6].date ?? "2024-05-01"),
                          humidity: weatherDataList?[6].humidity,
                          srcImage: weatherDataList?[6].icon,
                          maxTemp: weatherDataList?[6].maxTemp,
                          minTemp: weatherDataList?[6].minTemp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomContainer(
                            child: Column(
                          children: [
                            Text(
                              'AQI',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${getAirQuality(weatherModel?.airQuality ?? 12)[0]} (${(weatherModel?.airQuality ?? 0).toInt()})',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 0.6 * width,
                              child: LinearProgressIndicator(
                                value: ((weatherModel?.airQuality ?? 12) / 30),
                                color: getAirQuality(
                                    weatherModel?.airQuality ?? 12)[1],
                                backgroundColor: Color(0xffB0AEAE),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                minHeight: 10,
                              ),
                            )
                          ],
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomSmallContainer(
                        label: 'UV Index',
                        icon: Icons.light_mode,
                        value: '${weatherModel?.uvIndex ?? 8}',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Humidity',
                        icon: Icons.water_drop,
                        value: '${weatherModel?.humidity}%',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomSmallContainer(
                        label: 'Wind',
                        icon: Icons.air,
                        value:
                            '${weatherModel?.windSpeed} km/hr (${weatherModel?.windDirection})',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Dew Point',
                        icon: Icons.thermostat,
                        value: '${weatherModel?.dewPoint ?? 10}°',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomSmallContainer(
                        label: 'Pressure',
                        icon: Icons.compress_outlined,
                        value: '${weatherModel?.pressure ?? 0} mb',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Visibility',
                        icon: Icons.remove_red_eye_rounded,
                        value: '${weatherModel?.visibility ?? 0} km',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: width,
                    child: CustomContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Sunrise',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${weatherModel?.sunRise}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.sunny_snowing,
                            size: 100,
                            color: Colors.orangeAccent,
                          ),
                          Column(
                            children: [
                              Text(
                                'Sunset',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${weatherModel?.sunSet}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: width,
                    child: CustomContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Moonrise',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${weatherModel?.moonRise}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                getMoonImage(weatherModel?.moonPhase ?? "Full"),
                                cacheHeight: 100,
                                cacheWidth: 100,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${weatherModel?.moonPhase}',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Moonset',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${weatherModel?.moonSet}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Last Updated: ${weatherModel?.lastUpdated}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}

List getAirQuality(double value) {
  String quality = '';
  Color color = Colors.green;
  if (value < 50) {
    quality = 'Good';
    color = Colors.green;
  } else if (value < 100) {
    quality = 'Moderate';
    color = Colors.yellow;
  } else if (value < 150) {
    quality = 'Semi Unhealthy';
    color = Colors.orange;
  } else if (value < 200) {
    quality = 'Unhealthy';
    color = Colors.red;
  } else if (value < 300) {
    quality = 'Very Unhealthy';
    color = Color(0xFF772F28);
  } else {
    quality = 'Hazardous';
    color = Color(0xFF3D1B18);
  }
  return [quality, color];
}

String getMoonImage(String value) {
  String moonImage = " ";
  if (value == 'New') {
    moonImage = 'assets/New.png';
  } else if (value == 'Full') {
    moonImage = 'assets/full.png';
  } else if (value == 'Waning Crescent') {
    moonImage = 'assets/waning_cresent.png';
  } else if (value == 'Waning Gibbous') {
    moonImage = 'assets/waning_gibbous.png';
  } else if (value == 'Waxing Crescent') {
    moonImage = 'assets/waxing_cresent.png';
  } else if (value == 'Waning Crescent') {
    moonImage = 'assets/waning_cresent.png';
  } else if (value == 'Last Quarter') {
    moonImage = 'assets/last_q.png';
  } else {
    moonImage = 'assets/first_q';
  }
  return moonImage;
}
