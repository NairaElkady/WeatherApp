import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/model/weather_model.dart';

import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  late WeatherModel weatherModel;

  getWeather({required String cityname}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityname);
      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
