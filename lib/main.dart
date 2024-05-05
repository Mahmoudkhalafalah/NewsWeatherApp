import 'package:flutter/material.dart';
import 'package:news_weather_app_project/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_weather_app_project/views/home.dart';
import 'package:news_weather_app_project/views/login.dart';
import 'package:news_weather_app_project/views/signup.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyDvhWvWFlSKQo38i-yc0T05XpaS7s9Fv24',
        appId: '167311342966:android:0cf6f973b5316e26c88e57',
        messagingSenderId: '167311342966',
        projectId: 'weather-news-app-711a5'
    )
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home:Auth(),
        routes: {
          '/': (context) => const Auth(),
          'homeScreen': (context) =>  HomePage(),
          'signupScreen': (context) =>  const SignUpScreen(),
          'loginScreen': (context) =>  const LoginScreen(),
        }
    );
  }

}



