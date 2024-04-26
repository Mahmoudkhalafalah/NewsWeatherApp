import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff2d3253).withOpacity(0.4),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monday',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '7%',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        Text(
                          '30° 31°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monday',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '7%',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        Text(
                          '30° 31°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monday',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '7%',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        Text(
                          '30° 31°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monday',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '7%',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        Text(
                          '30° 31°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monday',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '7%',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        Text(
                          '30° 31°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monday',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '7%',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        Text(
                          '30° 31°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monday',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '7%',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                        ),
                        Text(
                          '30° 31°',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
