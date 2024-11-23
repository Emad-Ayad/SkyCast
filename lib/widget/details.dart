import 'package:flutter/material.dart';

class CustomDetails extends StatelessWidget {
  const CustomDetails({super.key, required this.image, required this.definition, required this.content});

  final String image;
  final String definition;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(image,
            height: 35, width: 35, fit: BoxFit.fill),
        Text(
          definition,
          style:
          TextStyle(color: Colors.white, fontSize: 15),
        ),
        Text(
          content,
          style:
          TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
