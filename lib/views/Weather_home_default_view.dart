import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_weather_app_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news_weather_app_project/models/weather_forecast_model.dart';
import 'package:news_weather_app_project/models/weather_model.dart';
import 'package:news_weather_app_project/services/weather_serivce.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';
import 'package:news_weather_app_project/views/widgets.dart';

WeatherModel? weatherModel;
List<WeatherForecastModel>? weatherDataList;
class WeatherDetails extends StatefulWidget {
  const WeatherDetails({Key? key});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  void updateUI() {
    setState(() {});
  }
  @override
  void initState() async{
    // TODO: implement initState
    super.initState();
    weatherModel = await WeatherService(Dio()).getWeatherDataWithLocation();
     weatherDataList = await WeatherService(Dio()).getForecastWeatherDataWithLocation();
  }
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetwee,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weatherModel?.cityName??"N/A",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 64,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          weatherModel?.weatherCondition??"N/A",
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
                          '${weatherModel?.maxTemp??0}° / ${weatherModel?.minTemp??0}° feels like ${weatherModel?.tempFeeling??0}°',
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
                      size: 80,
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
                        day: getDayName(weatherDataList?[0].date??"2024-05-01"),
                        humidity: weatherDataList?[0].humidity,
                        srcImage: weatherDataList?[0].icon,
                        maxTemp: weatherDataList?[0].maxTemp,
                        minTemp: weatherDataList?[0].minTemp,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomContainer(
                      child: Column(
                      children: [
                      CustomForecastDayWidget(
                      day: getDayName(weatherDataList?[1].date??"2024-05-01"),
                      humidity: weatherDataList?[1].humidity,
                      srcImage: weatherDataList?[1].icon,
                      maxTemp: weatherDataList?[1].maxTemp,
                      minTemp: weatherDataList?[1].minTemp,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomContainer(
                      child: Column(
                      children: [
                      CustomForecastDayWidget(
                      day: getDayName(weatherDataList?[2].date??"2024-05-01"),
                      humidity: weatherDataList?[2].humidity,
                      srcImage: weatherDataList?[2].icon,
                      maxTemp: weatherDataList?[2].maxTemp,
                      minTemp: weatherDataList?[2].minTemp,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomContainer(
                      child: Column(
                      children: [
                      CustomForecastDayWidget(
                      day: getDayName(weatherDataList?[3].date??"2024-05-01"),
                      humidity: weatherDataList?[3].humidity,
                      srcImage: weatherDataList?[3].icon,
                      maxTemp: weatherDataList?[3].maxTemp,
                      minTemp: weatherDataList?[3].minTemp,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomContainer(
                      child: Column(
                      children: [
                      CustomForecastDayWidget(
                      day: getDayName(weatherDataList?[4].date??"2024-05-01"),
                      humidity: weatherDataList?[4].humidity,
                      srcImage: weatherDataList?[4].icon,
                      maxTemp: weatherDataList?[4].maxTemp,
                      minTemp: weatherDataList?[4].minTemp,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomContainer(
                      child: Column(
                      children: [
                      CustomForecastDayWidget(
                      day: getDayName(weatherDataList?[5].date??"2024-05-01"),
                      humidity: weatherDataList?[5].humidity,
                      srcImage: weatherDataList?[5].icon,
                      maxTemp: weatherDataList?[5].maxTemp,
                      minTemp: weatherDataList?[5].minTemp,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomContainer(
                      child: Column(
                      children: [
                      CustomForecastDayWidget(
                      day: getDayName(weatherDataList?[6].date??"2024-05-01"),
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
                                weatherModel.,
                                style: TextStyle(fontSize: 32, color: Colors.white),
                              ),
                              Text(
                                'High',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: 0.6 * width,
                                child: LinearProgressIndicator(
                                  value: 0.3,
                                  color: Colors.green,
                                  backgroundColor: Color(0xffB0AEAE),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                        value: 'LOW'),
                    SizedBox(
                      width: 8,
                    ),
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW')
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
                        value: 'LOW'),
                    SizedBox(
                      width: 8,
                    ),
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW')
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
                        value: 'LOW'),
                    SizedBox(
                      width: 8,
                    ),
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW')
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
                              'sunrise',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '06:17',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.sunny_snowing,
                          size: 64,
                          color: Colors.orangeAccent,
                        ),
                        Column(
                          children: [
                            Text(
                              'sunrise',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '06:17',
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
                              'moonrise',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '06:17',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.shield_moon,
                              size: 64,
                              color: Colors.white,
                            ),
                            Text(
                              'Moon phase',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'moonrise',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '06:17',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
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
