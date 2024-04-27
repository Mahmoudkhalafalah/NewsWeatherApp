import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/views/weather_search_view.dart';
import 'package:news_weather_app_project/views/widgets.dart';

import '../models/weather_model.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({super.key});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  void updateUI() {
    setState(() {});
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weathermodel?.cityName ?? "cairo",
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
                          'cloud',
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
                          '33° / 18° feels like 20°',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Icon(
                        Icons.cloud,
                        size: 80,
                        color: Colors.white,
                      ),
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
                        day: 'Manday',
                        humidity: 70,
                        icon: Icons.cloud,
                        maxTemp: 37,
                        minTemp: 30,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomForecastDayWidget(
                        day: 'Manday',
                        humidity: 70,
                        icon: Icons.cloud,
                        maxTemp: 37,
                        minTemp: 30,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomForecastDayWidget(
                        day: 'Manday',
                        humidity: 70,
                        icon: Icons.cloud,
                        maxTemp: 37,
                        minTemp: 30,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomForecastDayWidget(
                        day: 'Manday',
                        humidity: 70,
                        icon: Icons.cloud,
                        maxTemp: 37,
                        minTemp: 30,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomForecastDayWidget(
                        day: 'Manday',
                        humidity: 70,
                        icon: Icons.cloud,
                        maxTemp: 37,
                        minTemp: 30,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomForecastDayWidget(
                        day: 'Manday',
                        humidity: 70,
                        icon: Icons.cloud,
                        maxTemp: 37,
                        minTemp: 30,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomForecastDayWidget(
                        day: 'Manday',
                        humidity: 70,
                        icon: Icons.cloud,
                        maxTemp: 37,
                        minTemp: 30,
                      )
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

WeatherModel? weathermodel;
