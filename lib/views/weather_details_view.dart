import 'dart:ui';

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
            Color(0xFF323A6B),
            Color(0xff404B79),
            Color(0xFF525D93),
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
                  color: Color(0xff3C436F)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('data'),
                      ],
                    ),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
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
