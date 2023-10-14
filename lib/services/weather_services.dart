import 'dart:developer';

import 'package:weatherapp/model/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = "5155c951269742ecadd174634232408";
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      var response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['message'] ??
          'opps there was an error, try later';
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      throw Exception('opps there was an error, try later');
    }
  }
}







  // Future<WeatherModel> getForcast({required String cityName}) async {
  //   var response = await dio.get(
  //       '$baseUrl/forecast.json?key=5155c951269742ecadd174634232408&q=$cityName&days=1');
  //   WeatherModel weatherModel = WeatherModel.fromjson(response.data);
  //   return weatherModel;
  // }
//}
