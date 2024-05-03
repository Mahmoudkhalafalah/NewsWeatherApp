import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news_weather_app_project/models/weather_model.dart';
import 'package:news_weather_app_project/views/Weather_home_default_view.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';
import 'package:news_weather_app_project/views/widgets.dart';


String? test;

class WeatherDetails extends StatefulWidget {

  WeatherDetails({Key? key}) ;

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
  
}


class _WeatherDetailsState extends State<WeatherDetails> {
  void updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {


    WeatherModel weatherModell = BlocProvider.of<GetWeatherCubit>(context).weatherModell;

    double width = MediaQuery
        .of(context)
        .size
        .width;

    if (weatherModell == null) {
       return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    else {
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
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return WeatherHomeDetails();
                  },
                ));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
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
                            weatherModell.cityName,
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
                            weatherModell.countryName,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            weatherModell.weatherCondition,
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
                            '${(weatherModell.maxTemp).toInt()}° / ${(weatherModell.minTemp).toInt()}° feels like ${(weatherModell?.tempFeeling ?? 0).toInt()}°',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.cloud,
                        size: 50,
                        color: Colors.white,
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
                                  '${getAirQuality(weatherModell?.airQuality ?? 12)[0]} (${(weatherModell?.airQuality ?? 0).toInt()})',
                                  style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: 0.6 * width,
                                  child: LinearProgressIndicator(
                                    value: ((weatherModell?.airQuality ?? 12) / 30),
                                    color: getAirQuality(
                                        weatherModell?.airQuality ?? 12)[1],
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
                        value: '${weatherModell?.uvIndex ?? 8}',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Humidity',
                        icon: Icons.water_drop,
                        value: '${weatherModell?.humidity}%',
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
                        '${weatherModell?.windSpeed} km/hr (${weatherModell?.windDirection})',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Dew Point',
                        icon: Icons.thermostat,
                        value: '${weatherModell?.dewPoint ?? 10}°',
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
                        value: '${weatherModell?.pressure ?? 0} mb',
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Visibility',
                        icon: Icons.remove_red_eye_rounded,
                        value: '${weatherModell?.visibility ?? 0} km',
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
                                '${weatherModell?.sunRise}',
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
                                '${weatherModell?.sunSet}',
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
                                '${weatherModell?.moonRise}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                getMoonImage(weatherModell?.moonPhase ?? "Full"),
                                cacheHeight: 100,
                                cacheWidth: 100,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${weatherModell?.moonPhase}',
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
                                '${weatherModell?.moonSet}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Last Updated: ${weatherModell?.lastUpdated}',
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

