part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState{

  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
  @override
  // TODO: implement props
  List<Object?> get props => [weatherModel];
}