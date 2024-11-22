import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast/bloc/states/states.dart';
import 'package:skycast/model/weather_model.dart';
import 'package:skycast/services/api_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await ApiService(dio: Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(
        WeatherFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
