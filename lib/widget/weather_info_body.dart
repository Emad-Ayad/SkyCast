import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast/bloc/cubits/get_weather_cubit.dart';
import 'package:skycast/model/weather_model.dart';
import 'package:skycast/widget/details.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Stack(children: [
      Image.asset(
        width: double.infinity,
        height: double.infinity,
        "assets/weather.jpg",
        fit: BoxFit.fill,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                weatherModel.cityName,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Text(
                "updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Row(
                children: [
                  SizedBox(width: 30),
                  Image.network(
                    height: 100,
                    width: 100,
                    "https:${weatherModel.image}",
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "${weatherModel.temp.round()}°C",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              //TODO
              Text(
                "${weatherModel.weatherCondition}",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomDetails(
                            image: "assets/maxTemp.png",
                            definition: "Max",
                            content: "${weatherModel.maxTemp.round()}°C"),
                        CustomDetails(
                            image: "assets/Humidity.png",
                            definition: "Humidity",
                            content: "${weatherModel.humidity.round()}%"),
                        CustomDetails(
                            image: "assets/wind.png",
                            definition: "Wind",
                            content: "${weatherModel.wind}km/h"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
