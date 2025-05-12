import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubits/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherservice) : super(WeatherInitial());

  WeatherService weatherservice;
  WeatherModel? weathermodel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoding());
    try {
      weathermodel = await weatherservice.getWeather(cityName: cityName);
      emit(WeatherSucces());
    } catch (e) {
      emit(WeatherFailure());
      print(e);
    }
  }
}
