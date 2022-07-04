import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bored_api/data/models/WeatherModel.dart';
import 'package:bored_api/services/weatherService.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherState get initialState => WeatherInitialState();

  final WeatherService _weatherService;

  WeatherBloc(this._weatherService) : super(WeatherLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      // Quando um evento for iniciado
      // emitir um estado de espera
      emit(WeatherLoadingState());
      // realizar um trabalho (requisição)
      final temperatura = await _weatherService.getWeather();
      // emitir um estade de sucesso ou de erro.
      emit(WeatherLoadedState(temperatura));
    });
  }
}
