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
        Text(
          day ?? "N/A",
          style: TextStyle(color: Colors.white),
        ),
        Text(
          '$humidity%',
          style: TextStyle(color: Colors.white),
        ),
        Image.network(
          'https:$srcImage' ?? "",
          cacheHeight: 30,
          cacheWidth: 30,
        ),
        Text(
          '${minTemp?.toInt()}° ${maxTemp?.toInt()}°',
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
              SizedBox(
                width: 8,
              ),
              Text(
                label,
                style: TextStyle(color: Colors.grey.shade500),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.white),
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
