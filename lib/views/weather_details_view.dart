import 'package:flutter/material.dart';
import 'package:news_weather_app_project/models/weather_model.dart';
import 'package:news_weather_app_project/views/home.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';
import 'package:news_weather_app_project/widgets/weather_widgets.dart';

import '../models/weather_forecast_model.dart';

class WeatherDetailsWithSearch extends StatelessWidget {
  const WeatherDetailsWithSearch(
      {super.key, required this.weatherDetails, required this.weatherDataList});
  final WeatherModel weatherDetails;
  final List<WeatherForecastModel> weatherDataList;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return HomePage();
                        }), (r) {
                          return false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const SearchView();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 0.6 * width,
                          child: Text(
                            maxLines: 2,
                            weatherDetails.cityName,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          weatherDetails.countryName,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          weatherDetails.weatherCondition,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          '${weatherDetails.maxTemp.toInt()}° / ${(weatherDetails.minTemp).toInt()}° feels like ${(weatherDetails.tempFeeling).toInt()}°',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Image.network(
                      'https:${weatherDetails.icon}',
                      cacheWidth: 200,
                      cacheHeight: 200,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 250,
                  child: CustomContainer(
                    child: ListView.builder(
                        itemCount: weatherDataList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CustomForecastDayWidget(
                                day: getDayName(weatherDataList[index].date),
                                humidity: weatherDataList[index].humidity,
                                srcImage: weatherDataList[index].icon,
                                maxTemp: weatherDataList[index].maxTemp,
                                minTemp: weatherDataList[index].minTemp,
                              ),
                              SizedBox(
                                height: (index != 6) ? 8 : 0,
                              )
                            ],
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomContainer(
                        child: Column(
                          children: [
                            const Text(
                              'AQI',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${getAirQuality(weatherDetails.airQuality!)[0]} (${(weatherDetails.airQuality!).toInt()})',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 0.6 * width,
                              child: LinearProgressIndicator(
                                value: ((weatherDetails.airQuality!)) / 30,
                                color: getAirQuality(
                                    weatherDetails.airQuality!)[1],
                                backgroundColor: const Color(0xffB0AEAE),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                minHeight: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomSmallContainer(
                      label: 'UV Index',
                      icon: Icons.light_mode,
                      value: '${weatherDetails.uvIndex}',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomSmallContainer(
                      label: 'Humidity',
                      icon: Icons.water_drop,
                      value: '${weatherDetails.humidity}%',
                    ),
                  ],
                ),
                const SizedBox(
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
                          '${weatherDetails.windSpeed} km/hr (${weatherDetails.windDirection})',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomSmallContainer(
                      label: 'Dew Point',
                      icon: Icons.thermostat,
                      value: '${weatherDetails.dewPoint}°',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomSmallContainer(
                      label: 'Pressure',
                      icon: Icons.compress_outlined,
                      value: '${weatherDetails.pressure} mb',
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomSmallContainer(
                      label: 'Visibility',
                      icon: Icons.remove_red_eye_rounded,
                      value: '${weatherDetails.visibility} km',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Sunrise',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${weatherDetails.sunRise}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.sunny_snowing,
                        size: 100,
                        color: Colors.orangeAccent,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Sunset',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${weatherDetails.sunSet}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Moonrise',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${weatherDetails.moonRise}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            getMoonImage(weatherDetails.moonPhase ?? "Full"),
                            cacheHeight: 100,
                            cacheWidth: 100,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${weatherDetails.moonPhase}',
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Moonset',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${weatherDetails.moonSet}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Last Updated: ${weatherDetails.lastUpdated}',
                  style: const TextStyle(
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
