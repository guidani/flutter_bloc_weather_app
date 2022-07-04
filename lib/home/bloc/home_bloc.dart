import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bored_api/data/models/BoredActivityModel.dart';
import 'package:bored_api/services/boredService.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final BoredService _boredService;

  HomeBloc(this._boredService) : super(HomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      // Quando um evento for iniciado
      // emitir um estado de espera
      emit(HomeLoadingState());
      // realizar o trabalho (a requisição)
      final activity = await _boredService.getBoredActivity();
      // emitir um estado de sucesso ou de erro
      emit(HomeLoadedState(activity));

    });
  }
}
