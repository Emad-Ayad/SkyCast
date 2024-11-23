import 'package:flutter/material.dart';

class HourlyCard extends StatelessWidget {
  const HourlyCard(
      {super.key, required this.time, required this.icon, required this.temp});

  final String time;
  final String icon;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Image.network(
              height: 50,
              width: 60,
              "https:$icon",
              fit: BoxFit.fill,
            ),
            Text(
              "$temp°C",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ));
  }
}
