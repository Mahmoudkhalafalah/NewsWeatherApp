import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomForecastDayWidget extends StatelessWidget {
  const CustomForecastDayWidget({
    super.key,
    required this.day,
    required this.humidity,
    required this.srcImage,
    required this.maxTemp,
    required this.minTemp,
  });
  final String? day;
  final int? humidity;
  final String? srcImage;
  final double? maxTemp;
  final double? minTemp;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            day ?? "N/A",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Text(
          '$humidity%',
          style: const TextStyle(color: Colors.white),
        ),
        Image.network(
          'https:$srcImage' ?? "",
          cacheHeight: 30,
          cacheWidth: 30,
        ),
        SizedBox(
          width: 48,
          child: Text(
            '${minTemp?.toInt()}° ${maxTemp?.toInt()}°',
            style: const TextStyle(color: Colors.white),
          ),
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
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: const Color(0xff2d3253).withOpacity(0.4),
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}


class CustomSmallContainer extends StatelessWidget {
  const CustomSmallContainer(
      {super.key,
      required this.label,
      required this.icon,
      required this.value});
  final String label;
  final IconData icon;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                icon,
                color: Colors.grey.shade500,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                label,
                style: TextStyle(color: Colors.grey.shade500),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}


String getDayName(String dateString) {
  DateTime date = DateFormat('yyyy-MM-dd').parse(dateString);
  List<String> days = [
    'Monday   ',
    'Tuesday  ',
    'Wednesday',
    'Thursday ',
    'Friday   ',
    'Saturday ',
    'Sunday   '
  ];
  return days[date.weekday - 1];
}
List getAirQuality(double value) {
  String quality = '';
  Color color = Colors.green;
  if (value < 50) {
    quality = 'Good';
    color = Colors.green;
  } else if (value < 100) {
    quality = 'Moderate';
    color = Colors.yellow;
  } else if (value < 150) {
    quality = 'Semi Unhealthy';
    color = Colors.orange;
  } else if (value < 200) {
    quality = 'Unhealthy';
    color = Colors.red;
  } else if (value < 300) {
    quality = 'Very Unhealthy';
    color = const Color(0xFF772F28);
  } else {
    quality = 'Hazardous';
    color = const Color(0xFF3D1B18);
  }
  return [quality, color];
}

String getMoonImage(String value) {
  String moonImage = " ";
  if (value == 'New') {
    moonImage = 'assets/New.png';
  } else if (value == 'Full') {
    moonImage = 'assets/full.png';
  } else if (value == 'Waning Crescent') {
    moonImage = 'assets/waning_cresent.png';
  } else if (value == 'Waning Gibbous') {
    moonImage = 'assets/waning_gibbous.png';
  } else if (value == 'Waxing Crescent') {
    moonImage = 'assets/waxing_cresent.png';
  } else if (value == 'Waning Crescent') {
    moonImage = 'assets/waning_cresent.png';
  } else if (value == 'Last Quarter') {
    moonImage = 'assets/last_q.png';
  } else {
    moonImage = 'assets/first_q';
  }
  return moonImage;
}