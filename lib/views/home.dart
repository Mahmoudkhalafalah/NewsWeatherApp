import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_weather_app_project/models/article_model.dart';
import 'package:news_weather_app_project/models/weather_model.dart';
import 'package:news_weather_app_project/views/Weather_home_default_view.dart';
import 'package:news_weather_app_project/views/news_home_views.dart';
import 'package:news_weather_app_project/views/profile_view.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = Provider.of<AppProvider>(context).selectedIndex;
    return Scaffold(
      appBar: AppBar(
        title: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Breeze Brief',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Open Sans'),
          ),
        ]),

        elevation: 8, // Add elevation for material design effect
        backgroundColor: const Color(0xFF4F598A), // Set background color
        flexibleSpace: Container(
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
        ),
      ),
      body: _getPage(selectedIndex),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFF323A69),
        style: TabStyle.react, // Assuming you want the react style
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.cloud, title: 'Weather'),
          TabItem(icon: Icons.new_releases, title: 'News'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: selectedIndex,
        onTap: (int index) {
          Provider.of<AppProvider>(context, listen: false).selectedIndex =
              index;
        },
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomeContent();
      case 1:
        return const WeatherHomeDetails();
      case 2:
        return const NewsHomeView();
      case 3:
        return const ProfileWidget(); // Assuming you have a ProfileWidget for the 'Profile' tab
      default:
        return const Center(child: Text('No page found!'));
    }
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<ArticleModel>? newsList;
  WeatherModel? weatherBrief;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    Provider.of<AppProvider>(context, listen: false).setWeatherData();
    weatherBrief = Provider.of<AppProvider>(context).weatherData;
    Provider.of<AppProvider>(context, listen: false).getGeneralNews();
    newsList = Provider.of<AppProvider>(context).generalArticles;

    if (weatherBrief == null || newsList == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weatherBrief?.cityName ?? "N/A",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          weatherBrief?.countryName ?? "N/A",
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
                          weatherBrief?.weatherCondition ?? "N/A",
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
                          '${(weatherBrief?.maxTemp ?? 0).toInt()}° / ${(weatherBrief?.minTemp ?? 0).toInt()}° feels like ${(weatherBrief?.tempFeeling ?? 0).toInt()}°',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Image.network(
                      'https:${weatherBrief?.icon ?? "//cdn.weatherapi.com/weather/64x64/night/113.png"}',
                      cacheWidth: 200,
                      cacheHeight: 200,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: height - 200, // Adjust the height of the list view
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: newsList!.map((article) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (article.image != null)
                              Image.network(
                                '${article.image}',
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ListTile(
                              title: Text(
                                article.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(article.subTitle ?? ''),
                              onTap: () {
                                // Open article URL
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
