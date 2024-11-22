import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast/bloc/cubits/get_weather_cubit.dart';
import 'package:skycast/bloc/states/states.dart';
import 'package:skycast/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          MaterialColor themeColor;

          // Determine the theme color based on the state
          if (state is WeatherLoadedState) {
            themeColor = getWeatherColor(state.weatherModel.weatherCondition);
          } else {
            themeColor = getWeatherColor(null); // Default color if no weather data
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
              primarySwatch: themeColor,
            ),
            home: HomeView(),
          );
        },
      ),
    );
  }
}


MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
  // Clear and Sunny
    case "sunny":
    case "clear":
      return Colors.yellow; // Sunny

  // Cloudy and Overcast
    case "partly cloudy":
    case "cloudy":
    case "overcast":
      return Colors.blueGrey; // Cloudy

  // Mist and Fog
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.blue; // Mist/Fog

  // Rain
    case "patchy rain possible":
    case "light rain":
    case "moderate rain":
    case "heavy rain":
    case "patchy light rain":
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
      return Colors.lightBlue; // Rain

  // Sleet and Freezing Rain
    case "patchy sleet possible":
    case "light sleet":
    case "moderate or heavy sleet":
    case "light freezing rain":
    case "moderate or heavy freezing rain":
      return Colors.grey; // Sleet/Freezing Rain

  // Snow
    case "patchy light snow":
    case "light snow":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
    case "light snow showers":
    case "moderate or heavy snow showers":
    case "blowing snow":
    case "blizzard":
    case "ice pellets":
      return Colors.grey; // Snow

  // Thunderstorms
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.deepOrange; // Thunderstorms
  // Other conditions

    case "patchy light drizzle":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
      return Colors.blueGrey; // Drizzle

  // Default for unknown conditions
    default:
      return Colors.blue; // Default color
  }
}
