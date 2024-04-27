import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:news_weather_app_project/views/login.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:LoginScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State{
 int _selectedIndex = 0; // Index for the Weather tab
  bool _isHomeTabActive = true; // Track if the home tab is active

  String _cityName = '';
  double _currentTemp = 0.0;
  String _weatherState = '';
  List<Map<String, dynamic>> _newsList = [];

  Future<void> _fetchWeatherData(String cityName) async {
    // Weather API call
    final apiKey = '2f8decbf816447469f8142742242404';
    final url = 'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName';
    
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setState(() {
        _currentTemp = json['current']['temp_c'];
        _weatherState = json['current']['condition']['text'];
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<void> _fetchNewsData() async {
    // News API call
    final newsApiKey = '81d2ace827fb44d6ace2c413133dbd6b';
    final newsUrl =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=65f19bd8ca6648969aaccc58c8765471';
    
    final response = await http.get(Uri.parse(newsUrl));

    if (response.statusCode == 200) {
      final List<dynamic> articles = jsonDecode(response.body)['articles'];
      setState(() {
        _newsList = articles.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Failed to load news data');
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocationAndWeather();
    _fetchNewsData();
  }

  Future<void> _getLocationAndWeather() async {
    try {
      // Check if permission is granted
      if (await Permission.location.isGranted) {
        // Permission is already granted, proceed to get location
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        List       <Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        setState(() {
          _cityName = placemarks[0].locality ?? 'Unknown';
        });
        await _fetchWeatherData(_cityName);
      } else {
        // Permission is not granted, request permission
        var status = await Permission.location.request();
        if (status.isGranted) {
          // Permission granted, proceed to get location
          _getLocationAndWeather();
        } else {
          // Permission denied, handle accordingly
          print('Location permission denied');
        }
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }
void _handleTabPressed(int index) {
  if (index == 0) {
    setState(() {
      _isHomeTabActive = true; // Activate the home tab
    });
  } else if (index == 1) {
  // Navigate to BlankPage when weather icon is pressed
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => BlankPage(returnCallback: _returnFromBlankPage)),
  );
}
else {
    // Navigate to BlankPage for other tabs
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BlankPage(returnCallback: _returnFromBlankPage,)),
    );
  }
}
void _returnFromBlankPage() {
  // Set home tab as active when returning from BlankPage
  setState(() {
    _isHomeTabActive = true;
    _selectedIndex = 0; // Set the selected index to 0 (home icon)
  });
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Weather App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 8, // Add elevation for material design effect
        backgroundColor: Color.fromRGBO(98, 126, 117, 1), // Set background color
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
               Color.fromRGBO(98, 126, 117, 1)
               ,Color.fromRGBO(98, 126, 117, 0.8)
              
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'City: $_cityName',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Current Temperature: $_currentTemp°C',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Weather State: $_weatherState',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'News',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 400, // Adjust the height of the list view
              child: ListView(
                scrollDirection: Axis.vertical,
                children: _newsList.map((article) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (article['urlToImage'] != null)
                            Image.network(
                              article['urlToImage'],
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ListTile(
                            title: Text(
                              article['title'] ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(article['description'] ?? ''),
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
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.cloud, title: 'Weather'),
          TabItem(icon: Icons.new_releases, title: 'News'),
          TabItem(icon: Icons.person, title: 'Sign'),
        ],
                backgroundColor: Color.fromRGBO(98, 126, 117, 1), // Set bottom bar color

      initialActiveIndex: _selectedIndex,
        onTap: _handleTabPressed,
      ),
    );
  }
}
class BlankPage extends StatelessWidget {
  final Function returnCallback;

  BlankPage({required this.returnCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Page'),
        backgroundColor: Color.fromRGBO(98, 126, 117, 1), // Set app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is a blank page.'),
            ElevatedButton(
              onPressed: () {
                // Return to previous page and call the returnCallback
                Navigator.pop(context);
                returnCallback();
              },
              child: Text('Return to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
