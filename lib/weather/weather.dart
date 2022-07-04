import 'package:bored_api/data/models/WeatherModel.dart';
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
              return _buildLoadedWidgetWeatherState(
                  context, state.weatherModel);
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

  Widget _buildLoadedWidgetWeatherState(
      BuildContext context, WeatherModel weatherModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            Text("Cidade: ${weatherModel.name}"),
            Text("Céu: ${weatherModel.weather[0].main}"),
            Text("Temperatura: ${weatherModel.main.temp}"),
            Text("Temperatura Máxima: ${weatherModel.main.tempMax}"),
            Text("Temperatura Mínima: ${weatherModel.main.tempMin}"),
          ],
        ),
      ),
    );
  }
}
