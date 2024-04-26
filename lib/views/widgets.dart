import 'package:flutter/material.dart';

class CustomForecastDayWidget extends StatelessWidget {
  const CustomForecastDayWidget({
    super.key,
    required this.day,
    required this.humidity,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
  });
  final String day;
  final int humidity;
  final IconData icon;
  final double maxTemp;
  final double minTemp;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '$humidity%',
          style: TextStyle(color: Colors.white),
        ),
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          '${minTemp.toInt()}° ${maxTemp.toInt()}°',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xff2d3253).withOpacity(0.4),
      ),
      padding: EdgeInsets.all(16),
      child: child,
    );
  }
}