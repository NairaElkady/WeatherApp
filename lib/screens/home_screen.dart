import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/model/wether_info_body.dart';
import 'package:weatherapp/screens/search_screen.dart' show SearchScreen;
import 'package:weatherapp/widgets/no_wather_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SearchScreen();
                }),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text("Weather app"),
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return const NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody();
        } else {
          return const Text('opps there was an error');
        }
      }),
    );
  }
}
