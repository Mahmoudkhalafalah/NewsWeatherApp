import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/providers/app_provider.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';
import 'package:news_weather_app_project/views/widgets.dart';
import 'package:provider/provider.dart';
import '../models/weather_forecast_model.dart';
import '../models/weather_model.dart';

class WeatherHomeDetails extends StatefulWidget {
  const WeatherHomeDetails({super.key});

  @override
  State<WeatherHomeDetails> createState() => _WeatherHomeDetailsState();
}

class _WeatherHomeDetailsState extends State<WeatherHomeDetails> {
  WeatherModel? weatherDataWithLocation;
  List<WeatherForecastModel>? weatherDataListWithLocation;
  @override
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Provider.of<AppProvider>(context, listen: false).setWeatherData();

    weatherDataWithLocation = Provider.of<AppProvider>(context).weatherData;
    weatherDataListWithLocation =
        Provider.of<AppProvider>(context).weatherDataList;
    if (weatherDataListWithLocation == null ||
        weatherDataWithLocation == null) {
      return const Scaffold(
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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                          Expanded(
                            child: Text(
                              weatherDataWithLocation?.cityName ?? "N/A",
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
                            weatherDataWithLocation?.countryName ?? "N/A",
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
                            weatherDataWithLocation?.weatherCondition ?? "N/A",
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
                            '${(weatherDataWithLocation?.maxTemp ?? 0).toInt()}° / ${(weatherDataWithLocation?.minTemp ?? 0).toInt()}° feels like ${(weatherDataWithLocation?.tempFeeling ?? 0).toInt()}°',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        'https:${weatherDataWithLocation?.icon ?? "//cdn.weatherapi.com/weather/64x64/night/113.png"}',
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
                          itemCount: weatherDataListWithLocation?.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CustomForecastDayWidget(
                                  day: getDayName(
                                      weatherDataListWithLocation![index].date),
                                  humidity: weatherDataListWithLocation![index]
                                      .humidity,
                                  srcImage:
                                      weatherDataListWithLocation![index].icon,
                                  maxTemp: weatherDataListWithLocation![index]
                                      .maxTemp,
                                  minTemp: weatherDataListWithLocation![index]
                                      .minTemp,
                                ),
                                SizedBox(
                                  height: (index != 6) ? 4 : 0,
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
                              '${getAirQuality(weatherDataWithLocation?.airQuality ?? 12)[0]} (${(weatherDataWithLocation?.airQuality ?? 0).toInt()})',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 0.6 * width,
                              child: LinearProgressIndicator(
                                value: ((weatherDataWithLocation?.airQuality ??
                                        12) /
                                    30),
                                color: getAirQuality(
                                    weatherDataWithLocation?.airQuality ??
                                        12)[1],
                                backgroundColor: const Color(0xffB0AEAE),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                minHeight: 10,
                              ),
                            )
                          ],
                        )),
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
                        value: '${weatherDataWithLocation?.uvIndex ?? 8}',
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Humidity',
                        icon: Icons.water_drop,
                        value: '${weatherDataWithLocation?.humidity}%',
                      )
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
                            '${weatherDataWithLocation?.windSpeed} km/hr (${weatherDataWithLocation?.windDirection})',
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Dew Point',
                        icon: Icons.thermostat,
                        value: '${weatherDataWithLocation?.dewPoint ?? 10}°',
                      )
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
                        value: '${weatherDataWithLocation?.pressure ?? 0} mb',
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomSmallContainer(
                        label: 'Visibility',
                        icon: Icons.remove_red_eye_rounded,
                        value: '${weatherDataWithLocation?.visibility ?? 0} km',
                      )
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
                              '${weatherDataWithLocation?.sunRise}',
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${weatherDataWithLocation?.sunSet}',
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${weatherDataWithLocation?.moonRise}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              getMoonImage(
                                  weatherDataWithLocation?.moonPhase ?? "Full"),
                              cacheHeight: 100,
                              cacheWidth: 100,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${weatherDataWithLocation?.moonPhase}',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Moonset',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${weatherDataWithLocation?.moonSet}',
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
                    'Last Updated: ${weatherDataWithLocation?.lastUpdated}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
