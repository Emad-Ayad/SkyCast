
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycast/bloc/cubits/get_weather_cubit.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) async{
               var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
               getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                label: Text("Search"),
                hintText: "Search A City",
                hintStyle: TextStyle(
                  color: Colors.grey
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.orange)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}