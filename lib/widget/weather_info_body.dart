import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast/bloc/cubits/get_weather_cubit.dart';
import 'package:skycast/model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            "updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https:${weatherModel.image}",
              ),
              Text(
                "${weatherModel.temp.round()}°C",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Column(
                children: [
                  Text(
                    "Max Temp: ${weatherModel.maxTemp.round()}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Min Temp: ${weatherModel.minTemp.round()}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            "${weatherModel.weatherCondition}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}