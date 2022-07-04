import 'package:bored_api/services/weatherService.dart';
import 'package:bored_api/weather/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(
          RepositoryProvider.of<WeatherService>(context),
        )..add(LoadApiEvent()),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return _buildLoadingState();
            }
            if (state is WeatherLoadedState) {
              return _buildLoadedWidgetWeatherState();
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoadedWidgetWeatherState() {
    return Center(
      child: Text('TEMPERATURA'),
    );
  }
}
