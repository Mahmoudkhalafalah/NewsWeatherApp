import 'package:flutter/material.dart';
import 'package:news_weather_app_project/views/widgets.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '20°',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 64,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      'cloud',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
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
                CustomContainer(
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
                    LinearProgressIndicator(
                      value: 0.3,
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      minHeight: 10,
                    )
                  ],
                )),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW'),
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW')
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW'),
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW')
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW'),
                    CustomSmallContainer(
                        label: 'UV Index', icon: Icons.light_mode, value: 'LOW')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
