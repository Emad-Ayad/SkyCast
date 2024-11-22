import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skycast/model/weather_model.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "440bdeb908944ac08c4204818242011";

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          "oops there is an error ,try later ";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there is an error ,try later ");
    }
  }
}
