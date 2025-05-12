import 'package:flutter/material.dart';
//import 'package:weather_app/models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubits/weather_cubit.dart';

import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(
    //ChangeNotifierProvider
    BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weathermodel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(
                  context,
                ).weathermodel!.getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
