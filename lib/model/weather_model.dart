import 'dart:ffi';

import 'package:skycast/model/hourly_model.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final double wind;
  final String weatherCondition;
  final List<HourlyModel> hourlyData;

  WeatherModel({required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.wind,
    required this.weatherCondition,
    required this.hourlyData
  });

  factory WeatherModel.fromJson(json){
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        image: json['current']['condition']['icon'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        humidity: json['current']['humidity'],
        wind: json['current']['wind_kph'],
        weatherCondition: json['current']['condition']['text'],
        hourlyData: getHourlyData(json),
    );
  }

  static List<HourlyModel> getHourlyData(Map<String, dynamic> json) {
    List newJson = json['forecast']['forecastday'][0]['hour'];
    List<HourlyModel> list = [];
    for (int i = 0; i < newJson.length; i++) {
      list.add(HourlyModel.fromJson(newJson[i]));
    }
    return list;
  }
}
